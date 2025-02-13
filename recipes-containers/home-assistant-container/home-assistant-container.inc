LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

DOCKER_STORE = "${WORKDIR}/docker-store"
ARCHIVE_IMAGE = "home-assistant-${CONTAINER_IMAGE_VERSION}.tar"

SRC_URI = " \
    file://home-assistant.service \
    file://homeassistant-image.sh \
"

DEPENDS += "skopeo-native"
RDEPENDS:${PN} += "docker-ce bash"

inherit image-container
CONTAINER_IMAGE_FORMAT = "docker"

REQUIRED_DISTRO_FEATURES= "systemd"

inherit features_check
inherit systemd
SYSTEMD_SERVICE_${PN} = "home-assistant.service"
SYSTEMD_AUTO_ENABLE_${PN} = "enable"

do_compile[noexec] = "1"

addtask fetch_container after do_configure before do_install

do_fetch_container[network] = "1"

do_fetch_container() {
    if [ -f "${DOCKER_STORE}/${ARCHIVE_IMAGE}.gz" ]; then
        rm -f ${DOCKER_STORE}/${ARCHIVE_IMAGE}.gz
    else
        if [ ! -d "${DOCKER_STORE}" ]; then
            mkdir -p ${DOCKER_STORE}
        fi
    fi

    # pull container image
    # set XDG_RUNTIME_DIR to /run/user/${user} to fix "/run/containers/1000/auth.json: permission denied" issue
    XDG_RUNTIME_DIR="/run/user/$(id -u)" \
    skopeo --override-arch=${CONTAINER_IMAGE_ARCH} --override-os=linux \
           copy docker://${CONTAINER_IMAGE_DOCKER} \
           docker-archive:${DOCKER_STORE}/${ARCHIVE_IMAGE}:${CONTAINER_IMAGE_NAME}:${CONTAINER_IMAGE_VERSION}

    # compress archive file
    gzip ${DOCKER_STORE}/${ARCHIVE_IMAGE}

    echo "${CONTAINER_IMAGE_NAME} ${CONTAINER_IMAGE_VERSION}" > ${DOCKER_STORE}/home-assistant.manifest
}

do_install() {
    [ -f "${DOCKER_STORE}/${ARCHIVE_IMAGE}.gz" ] || bbfatal "${ARCHIVE_IMAGE}.gz does not exist"

    # install container and manifest files to /usr/share/container-images/
    install -d "${D}${datadir}/container-images"
    install -m 644 "${DOCKER_STORE}/${ARCHIVE_IMAGE}.gz" "${D}${datadir}/container-images/${ARCHIVE_IMAGE}.gz"
    install -m 644 "${DOCKER_STORE}/home-assistant.manifest" "${D}${datadir}/container-images/home-assistant.manifest"

    # install home assistant services
    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}" = "systemd" ]; then
        install -d "${D}${systemd_unitdir}/system"
        install -m 0644 "${WORKDIR}/home-assistant.service" "${D}${systemd_unitdir}/system/"
    fi

    install -d "${D}${bindir}"
    install -m 0755 "${WORKDIR}/homeassistant-image.sh" "${D}${bindir}/homeassistant-image"
}

SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${PN}', '', d)}"
SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'home-assistant.service', '', d)}"

FILES:${PN} += " \
    ${datadir}/container-images/ \
    ${systemd_unitdir}/system/home-assistant.service \
    ${bindir}/homeassistant-image \
"

HOSTTOOLS_NONFATAL += "sudo skopeo newgidmap newuidmap"
