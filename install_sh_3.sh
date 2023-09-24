ln -sf /usr/share/zoneinfo/Europe/Budapest /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP="hu"" >> /etc/vconsole.conf
systemctl enable NetworkManager
useradd -m -G wheel -s /bin/bash gyro
echo "%wheel ALL=(ALL:ALL) ALL" >> /ect/sudoers
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
mv *.sh /home/gyro/gyrosarchinstall
umount /dev/sda1
umount /dev/sda2
echo "Type exit then reboot the PC!"