#!/bin/bash

# Check for packages with mismatched checksums
mismatched_packages=$(sudo pacman -Qkk 2>&1 | grep -E "ERRORS|corrupted" | awk '{print $2}')

# Reinstall packages with mismatched checksums
for package in $mismatched_packages; do
    echo "Reinstalling $package"
    sudo pacman -S $package --noconfirm
done
