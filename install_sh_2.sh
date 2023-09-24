mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
mount /dev/sda2 /mnt
pacstrap /mnt base linux linux-firmware sudo grub efibootmgr networkmanager intel-ucode vim
genfstab -U /mnt >> /mnt/etc/fstab
clear
echo "Run install script no. 3!"
echo "Just type in: ./install_sh_3.sh"
cp *.sh /mnt/ 
arch-chroot /mnt