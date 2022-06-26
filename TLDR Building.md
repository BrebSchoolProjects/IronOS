# Build Instructions for IronOS

## Build everything

* Ensure docker daemon is running (eg. systemctl start docker.service)
* Start build script: bash build.sh

## Build specific FW

* Ensure docker daemon is running (eg. systemctl start docker.service)
* Start dev script: bash start_dev.sh
* Enter source directory: cd source/source
* Optionally fix git config:  git config --global --add safe.directory /build/source
* Start build: make -j8 model=TS100 custom_multi_langs="EN DE" firmware-multi_Custom
    (make clean might be required before)

## Flashing

* Note: I'm not sure, long file names for the hex files might be a problem. Rename them to something shorter, if flashing does not work
* Connect iron with USB and keep the button near the tip pressed -> DFU mode is active
* use the copy_fw.sh script for copying the hex file to the iron. Parameter is the location of the hex file

## Using VS Code

* Start container with the start_dev.sh script
* Use the "Remote - Containers" extension to connect to the container (small green button in the lower left)
* Ensure that C++ Extensions are also installed in the Container environment (Install again in container vs code)

