valid_input=false
while [ "$valid_input" == false ]; do
    echo -n "Do you want me to install ungoogled chromium to your system? (yes, no - case sensitive so lowercase only!) "
    read answer
    if [ "$answer" == "yes" ]; then
        sudo echo "[home_ungoogled_chromium_Arch]" >> /etc/pacman.conf
        sudo echo "Server = https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/$arch" >> /etc/pacman.conf
        sudo key=$(curl -fsSL https://download.opensuse.org/repositories/home:ungoogled_chromium/Arch/$(uname -m)/home_ungoogled_chromium_Arch.key)
        sudo fingerprint=$(gpg --quiet --with-colons --import-options show-only --import --fingerprint <<< "${key}" | awk -F: '$1 == "fpr" { print $10 }')
        sudo pacman-key --init
        sudo pacman-key --add - <<< "${key}"
        sudo pacman-key --lsign-key "${fingerprint}"
        sudo pacman -Syu home_ungoogled_chromium_Arch/ungoogled-chromium
        valid_input=true
    elif [ "$answer" == "no" ]; then
        sudo pacman -Syu firefox
        valid_input=true
    else
        echo "Can't figure it out..."
    fi
done
yay -Syu hyprland dunst kitty thunar rofi qt5-wayland qt6-wayland sddm ranger xdg-desktop-portal-hyprland xdg-desktop-portal pw-volume
sudo systemctl enable sddm
echo "Restart and run the hyprland 2nd insallation script!"