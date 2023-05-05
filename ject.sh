#!/bin/bash

# Set the chroot environment as a temporary variable
chrootDir="./chrootDir"

# Prompt user for input and output paths
read -p "Enter path to input ISO: " input_iso
read -p "Enter path to output ISO (press enter for default): " output_iso

# Set default output path if not specified by user
if [ -z "$output_iso" ]; then
  output_iso="${input_iso%.*}_updated_$(date +%y%m%d).iso"
fi

# Create temporary directories for mount and chroot
mkdir -p isomount "$chrootDir"

# Mount ISO to isomount directory
sudo mount -o loop "$input_iso" isomount

# Extract the ISO to chrootDir directory
sudo unsquashfs -d "$chrootDir" isomount/casper/filesystem.squashfs

# Add network connectivity to the chroot environment
sudo mount --bind /dev "$chrootDir/dev"
sudo mount --bind /dev/pts "$chrootDir/dev/pts"
sudo mount --bind /proc "$chrootDir/proc"
sudo mount --bind /sys "$chrootDir/sys"

# Mount the ISO to a temporary directory
mount_dir=$(mktemp -d)
sudo mount -o loop "$input_iso" "$mount_dir"

# Chroot into the environment and execute commands
sudo chroot "$chrootDir" /bin/bash -c "
  # Indentation for the
  # injected shell code,
  # which goes here
"

# Exit chroot environment and unmount bind mounts
sudo umount "$chrootDir/{dev/pts,dev,proc,sys}"

# Repack the updated chroot directory into a new ISO file
sudo mksquashfs "$chrootDir" isomount/casper/filesystem.squashfs -comp xz -wildcards

# Create the new ISO image
sudo xorriso -as mkisofs -iso-level 3 -o "$output_iso" isomount

# Cleanup temporary directories
sudo umount isomount
sudo rm -rf isomount "$chrootDir"
