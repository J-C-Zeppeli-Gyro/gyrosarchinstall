sudo pacman -Syu fakeroot go make gcc git neofetch base-devel nano neovim openssh wget iwd wireless_tools wpa_supplicant xdg-utils pipewire pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire libpulse wireplumber
sudo systemctl enable --now pipewire.service
sudo systemctl enable --now pipewire-jack.service
sudo systemctl enable --now pipewire-pulse.service
mkdir ~/aur
cd ~/aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
echo "yay is now installed. You can install any WM if you want."