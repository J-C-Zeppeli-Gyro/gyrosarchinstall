loadkeys hu
timedatectl set-timezone CET
timedatectl
timedatectl set-ntp true
echo -e "Now you have to create the partitions with the cfdisk command, create swap!\nsda1 will be /boot, sda2 will be swap, and sda3 will be /\nuse gpt - !!!Note make sure you want to use sda drive for this, or you have to edit the 2. script!!!"