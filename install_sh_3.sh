ln -sf /usr/share/zoneinfo/Europe/Budapest /etc/localtime
hwclock --systohc
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP="hu"" >> /etc/vconsole.conf
systemctl enable NetworkManager
echo -n "Please enter your name for the new user: "
read username
useradd -m -G wheel -s /bin/bash $username
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
clear
echo "Set root password below:"
passwd
clear
echo "Set $username's password below:"
passwd $username
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
clear
mkdir /home/$username/gyrosarchinstall
cp *.sh /home/$username/gyrosarchinstall
chmod 777 /home/$username/gyrosarchinstall/*
mv *.sh /root/gyrosarchinstall
echo -n "Enter the hostname: "
read hostname
echo $hostname >> /etc/hostname
echo "Type exit and run the 4th script!"