#! /bin/bash
# adapted from https://github.com/dashnowlab/lab-website

# name of image
IMAGE=lab-website-renderer:latest

# name of running container
CONTAINER=lab-website-renderer

# choose platform flag
PLATFORM=""

# default vars
DOCKER_RUN="docker run"
WORKING_DIR=$(pwd)

# fix windows faux linux shells/tools
if [[ $OSTYPE == msys* ]] || [[ $OSTYPE == cygwin* ]]; then
    DOCKER_RUN="winpty docker run"
    WORKING_DIR=$(cmd //c cd)
fi

# build docker image
docker build ${PLATFORM} \
    --tag ${IMAGE} \
    --file ./.docker/Dockerfile . && \

# run built docker image
# NOTE: On macOS (especially when the repo lives in a cloud-synced folder like SynologyDrive/iCloud),
# writing Jekyll output into the bind-mounted `_site` directory can fail with Errno::EDEADLK.
# By default, mount `_site` to a local temp directory on the host.
SITE_OUTPUT_DIR=""
if [[ $OSTYPE != msys* ]] && [[ $OSTYPE != cygwin* ]]; then
    SITE_OUTPUT_DIR="${TMPDIR:-/tmp}/lab-website-renderer-_site"
    mkdir -p "${SITE_OUTPUT_DIR}"
fi

DOCKER_VOLUMES=(
    --volume "${WORKING_DIR}:/usr/src/app"
)
if [[ -n "${SITE_OUTPUT_DIR}" ]]; then
    DOCKER_VOLUMES+=(--volume "${SITE_OUTPUT_DIR}:/usr/src/app/_site")
fi

${DOCKER_RUN} ${PLATFORM} \
    --name ${CONTAINER} \
    --init \
    --rm \
    --interactive \
    --tty \
    --publish 4000:4000 \
    --publish 35729:35729 \
    "${DOCKER_VOLUMES[@]}" \
    ${IMAGE} "$@"