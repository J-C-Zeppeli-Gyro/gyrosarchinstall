sudo pacman -Syu base-devel git libx11 libxft xorg-server xorg-xinit terminus-font libxinerama sddm
mkdir -p ~/.local/src
git clone git://git.suckless.org/st ~/.local/src/st
git clone git://git.suckless.org/dmenu ~/.local/src/dmenu
git clone git://git.suckless.org/dwm ~/.local/src/dwm
cd ~/.local/src/st
make clean
sudo make install
cd ~/.local/src/dmenu
make clean
sudo make install
cd ~/.local/src/dwm
make clean
sudo make install
sudo mkdir /usr/share/xsessions
sudo cat << EOF > /usr/share/xsessions/.desktop
[Desktop Entry]
Encoding=UTF-8
Name=DWM
Comment=Log in using the Dynamic Window Manager
Exec=/usr/local/bin/dwm
Icon=/usr/local/bin/dwm.png
TryExec=/usr/local/bin/dwm
Type=XSession
EOF
cat << EOF > ~/.xprofile
dwmstatus 2>&1 >/dev/null &
setxkbmap -layout hu,gr -option grp:alt_caps_toggle
EOF
cat << EOF > ~/.xinitrc
exec dwm
EOF
sudo systemctl enable sddm
reboot