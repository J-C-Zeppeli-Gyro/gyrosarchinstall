sudo pacman -Syu pulseaudio fakeroot go make gcc git neofetch base-devel
mkdir ~/aur
cd ~/aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
echo "yay is now installed. You can install any WM if you want."