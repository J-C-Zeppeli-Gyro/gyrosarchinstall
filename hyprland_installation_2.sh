sed -i 's/^autogenerated = 1 # remove this line to remove the warning/autogenerated = 0 # remove this line to remove the warning/' ~/.config/hypr/hyprland.conf
sed -i 's/^    kb_layout = us/    kb_layout = hu/' ~/.config/hypr/hyprland.conf
sed -i 's/^bind = $mainMod, R, exec, wofi --show drun/bind = $mainMod, D, exec, rofi -show drun/' ~/.config/hypr/hyprland.conf
echo "bind =, XF86AudioRaiseVolume, exec, pw-volume change +5%" >> ~/.config/hypr/hyprland.conf
echo "bind =, XF86AudioLowerVolume, exec, pw-volume change -5%" >> ~/.config/hypr/hyprland.conf
echo "bind =, XF86AudioMute, exec, pw-volume mute toggle" >> ~/.config/hypr/hyprland.conf