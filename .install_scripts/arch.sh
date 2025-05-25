#!/bin/sh

error_heading() {
    echo "- [ERROR] -"
}

package_list="arch_packages.txt"

if [[ -e $package_list ]]; then
    packages="$(cat $package_list)"

    if command -v "paru" &> /dev/null; then
        paru -Sy --needed --noconfirm $packages
    elif command -v "yay"  &> /dev/null; then
        yay -Sy --needed --noconfirm $packages
    else
        error_heading
        echo "No AUR package manager found!"
        echo "Please install 'paru' or 'yay' before running this script!"
    fi
else
    error_heading
    echo "Please 'cd' into '.install_scripts' before running this script!"
fi
