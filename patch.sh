#!/bin/bash
#set -xv
export HEADER="==========================================================================="


echo
echo $HEADER
echo retrieve the latest seabios from upstream git repo.
echo $HEADER
echo

git submodule sync
git submodule update

cd seabios.submodule && git reset --hard && git clean -f; cd ..


echo
echo $HEADER
echo "dump the slic from motherboard (root password required)"
echo $HEADER
echo


# dump the slic table from the computer (note: requires root)
sudo xxd -i /sys/firmware/acpi/tables/SLIC | grep -v len | sed 's/unsigned char.*/static char SLIC[] = {/' > seabios.submodule/src/acpi-slic.hex

echo
echo $HEADER
echo patching seabios...
echo $HEADER
echo

patch seabios.submodule/src/acpi.c seabios.patch

echo
echo $HEADER
echo compiling seabios...
echo $HEADER
echo

cd seabios.submodule
make

echo
echo $HEADER
echo your bios awaits....
echo $HEADER
echo

cd ..
ls seabios.submodule/out/bios.bin

