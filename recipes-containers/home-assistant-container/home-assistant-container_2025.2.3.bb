SUMMARY = "Embed Docker store in the system"
DESCRIPTION = "Pull the container image and install the Docker store"

CONTAINER_IMAGE_NAME = "homeassistant/home-assistant"
CONTAINER_IMAGE_VERSION = "${PV}"
CONTAINER_IMAGE_ARCH = "arm64"
CONTAINER_IMAGE_DOCKER = "docker.io/${CONTAINER_IMAGE_NAME}:${CONTAINER_IMAGE_VERSION}"

require home-assistant-container.inc
