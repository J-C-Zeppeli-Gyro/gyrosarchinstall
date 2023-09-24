ln -sf /usr/share/zoneinfo/Europe/Budapest /etc/localtime
hwclock --systohc
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP="hu"" >> /etc/vconsole.conf
systemctl enable NetworkManager
useradd -m -G wheel -s /bin/bash gyro
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
clear
echo "Set root password below:"
passwd
clear
echo "Set user password below:"
passwd gyro
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
clear
mkdir /home/gyro/gyrosarchinstall
cp *.sh /home/gyro/gyrosarchinstall
chmod 777 /home/gyro/gyrosarchinstall/*
cp *.sh /root/gyrosarchinstall
echo "Type exit and run the 4th script!"