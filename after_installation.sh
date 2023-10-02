sudo pacman -Syu go git neofetch nano neovim openssh wget iwd wireless_tools xdg-utils pipewire pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire libpulse wireplumber gst-plugins-bad gst-plugins-base gst-plugins-good
systemctl --user enable pipewire.service
systemctl --user enable pipewire-pulse.service
mkdir ~/aur
cd ~/aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
echo "yay is now installed. You can install any WM if you want."
yay -Syu gst-plugin-openh264