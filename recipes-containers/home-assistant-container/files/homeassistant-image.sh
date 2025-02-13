#!/bin/bash
#
# This script loads the home-assistant container image to system
# file.
#

IMAGE_DIR="/usr/share/container-images"
MANIFEST="${IMAGE_DIR}/home-assistant.manifest"

info() {
    echo "home-assistant: ${*}"
    logger -t "home-assistant" "${*}"
}

die() {
    info "Fatal: ${*}"
    exit 1
}

is_image_loaded() {
    local repository version
    repository=${1}
    version=${2}

    docker inspect --type=image "${repository}:${version}" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        # Image has loaded
        return 0
    else
        # Image not loading yet
        return 1
    fi
}

load_image() {
    local image=${1}

    if [ -f "${IMAGE_DIR}/${image}" ]; then
        info "Loading the ${image} into the docker store..."
        gzip -c -d "${IMAGE_DIR}/${image}" | docker load
        if [ $? -eq 0 ]; then
            # Success loading image 
            return 0
        else
            # Failed to load image
            return 1
        fi
    else
        info "Warning: ${IMAGE_DIR}/${image} not found, skipping..."
        return 1
    fi
}

start_container() {
    local repository version container status
    repository=${1}
    version=${2}
    container=$(basename ${repository})

    info "Starting container ${container}..."
    status=$(docker inspect "${container}" --format='{{.State.Status}}')

    case "${status}" in
    exited)
        # This case requires a different startup method
        docker start "${container}"
        ;;
    running)
        info "${container} already running..."
        ;;
    *)
        docker run ${DOCKER_OPTS} --name "${container}" -d "${repository}:${version}"
        ;;
    esac
}

stop_container() {
    local repository container
    repository=${1}
    container=$(basename ${repository})

    info "Stopping container ${container}..."

    if ! docker stop "${container}"; then
        die "Error stopping ${docker_name}"
    fi
}

remove_container() {
    local repository container
    repository=${1}
    container=$(basename ${repository})

    info "Removing container ${container}..."

    if ! docker rm "${container}"; then
        die "Error removing ${container}"
    fi
}

########################### MAIN SCRIPT ###########################
REPOSITORY=""
VERSION=""
IMAGE=""

DOCKER_OPTS=" \
  --privileged \
  --restart=unless-stopped \
  --network=host \
  -v /run/dbus:/run/dbus:ro \
  -v /etc/home-assistant:/config \
"

if [ ! -f "${MANIFEST}" ]; then
    die "${MANIFEST} is not installed on the system"
fi

# read setting from manifest file
while read -r REPOSITORY VERSION; do
    IMAGE="$(basename ${REPOSITORY})-${VERSION}.tar.gz"
    break
done < ${MANIFEST}

case "${1}" in
load)
    if ! is_image_loaded ${REPOSITORY} ${VERSION} ; then
        if ! load_image ${IMAGE} ; then
            info "Failed to load the image..."
        else
            info "Success loading the image..."
        fi
    fi
    ;;
start)
    info "Starting container from ${MANIFEST}"
    start_container ${REPOSITORY} ${VERSION}
    ;;
stop)
    info "Stopping the container"
    stop_container ${REPOSITORY}
    ;;
unload)
    info "Stopping the container ${tag}"
    stop_container ${REPOSITORY}
    remove_container ${REPOSITORY}
    ;;
*)
    die "Usage: ${0} {load|start|stop}"
    ;;
esac
