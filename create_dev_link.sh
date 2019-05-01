#!/bin/bash

cd $(dirname "${0}")

export PYTHONPATH=./temp

# Linux, BSD and Mac OSX
TARGET_DIR="~/.config/deluge/plugins"

# Windows
if [ ! -z "${APPDATA}" ];
then
    TARGET_DIR="${APPDATA}/deluge/plugins"
fi

if [ ! -d "${PYTHONPATH}" ]; then
    mkdir ${PYTHONPATH}
fi

find ${PYTHONPATH} -mindepth 1 -delete

python setup.py build develop --install-dir ${PYTHONPATH}

if [ -d "${TARGET_DIR}" ]; then
    cp ${PYTHONPATH}/AutoShutdown.egg-link ${TARGET_DIR}
fi
