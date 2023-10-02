ln -sf /usr/share/zoneinfo/Europe/Budapest /etc/localtime
hwclock --systohc
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP="hu"" >> /etc/vconsole.conf
systemctl enable NetworkManager
valid_input=false
while [ "$valid_input" == false ]; do
    echo -n "Do you have an SSD? (yes, no - case sensitive so lowercase only!) "
    read ssd
    if [ "$ssd" == "yes" ]; then
        systemctl enable fstrim.timer
        valid_input=true
    elif [ "$ssd" == "no" ]; then
        valid_input=true
    else
        echo "Can't figure it out..."
    fi
done
sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 5/' /etc/pacman.conf
echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
echo "Set root password below:"
passwd
clear
echo -n "Please enter a name for the new privileged user: "
read username
useradd -m -g users -G wheel,storage,power -s /bin/bash $username
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
clear
echo "Set $username's password below:"
passwd $username
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
clear
mkdir /home/$username/gyrosarchinstall
cp *.sh /home/$username/gyrosarchinstall
chown $username:$username /home/$username/gyrosarchinstall
chmod 777 /home/$username/gyrosarchinstall/*
mkdir /root/gyrosarchinstall
mv *.sh /root/gyrosarchinstall
chmod 777 /root/gyrosarchinstall/*
echo -n "Enter the hostname: "
read hostname
echo $hostname >> /etc/hostname
echo "Type exit and run the 4th script!"