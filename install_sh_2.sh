mkfs.vfat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
swapon /dev/sda2
mount /dev/sda3 /mnt
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bk
pacman -Sy pacman-contrib
rankmirriors -n 6 /etc/pacman.d/mirrorlist.bk > /etc/pacman.d/mirrorlist
valid_input=false
while [ "$valid_input" == false ]; do
    echo -n "What CPU do you have? Intel or Amd? (intel, amd - case sensitive so lowercase only!) "
    read cpu
    if [ "$cpu" == "amd" ]; then
        pacstrap -K /mnt base linux linux-firmware base-devel sudo grub efibootmgr networkmanager amd-ucode bash-completion
        valid_input=true
    elif [ "$cpu" == "intel" ]; then
        pacstrap -K /mnt base linux linux-firmware base-devel sudo grub efibootmgr networkmanager intel-ucode bash-completion
        valid_input=true
    else
        echo "Invalid CPU type. Please enter amd or intel."
    fi
done
genfstab -U -p /mnt >> /mnt/etc/fstab
clear
echo "Run install script no. 3!"
echo "Just type in: ./install_sh_3.sh"
cp *.sh /mnt/ 
arch-chroot /mnt