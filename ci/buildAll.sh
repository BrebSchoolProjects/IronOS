#!/bin/sh
set -e
set -u

mkdir -p /build/ci/artefacts

# Build STM code
git config --global --add safe.directory /build/source
cd /build/source/source/
bash ./build.sh || exit 1
echo "All Firmware built"
# Copy out all the final resulting files we would like to store for the next op
cp -r /build/source/source/Hexfile/*.hex  /build/ci/artefacts/
cp -r /build/source/source/Hexfile/*.bin  /build/ci/artefacts/
