# Here's the story...

- Computer purchased with w/Windows 7 preinstalled.
- Preferred development environment is linux.
- Sometimes have to do development in windows.

# Problem:

To use the license which came with the computer you have to dual boot between
linux and windows. Running windows in a virtual machine doesn't work as the
computers ACPI tables are not exposed - which from a security pov: is good.

# Solution:

Extract the ACPI tables from the computer and embed them into the virtual
machine BIOS and don't run more then one VM.

# Do the dance:
- Does /sys/firmware/acpi/tables/ exist?
    YES: Proceed.
    NO: Go away you dirty pirate.

- ./patch.sh
- cp /usr/share/qemu/bios.bin /usr/share/qemu/bios-orig.bin
- cp seabios.submodule/out/bios.bin /usr/share/qemu/bios.bin

