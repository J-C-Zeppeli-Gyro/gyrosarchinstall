sudo pacman -Syu fakeroot go make gcc git neofetch base-devel nano neovim openssh wget iwd wireless_tools wpa_supplicant xdg-utils pipewire pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire libpulse wireplumber
systemctl --user enable pipewire.service
systemctl --user enable pipwire-pulse.service
mkdir ~/aur
cd ~/aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
echo "yay is now installed. You can install any WM if you want."