sudo sed -i '/\[home_ungoogled_chromium_Arch\]/,/Server = https:\/\/download.opensuse.org\/repositories\/home:\/ungoogled_chromium\/Arch\/$arch/ d' /etc/pacman.conf
key=$(curl -fsSL https://download.opensuse.org/repositories/home:ungoogled_chromium/Arch/$(uname -m)/home_ungoogled_chromium_Arch.key)
fingerprint=$(gpg --quiet --with-colons --import-options show-only --import --fingerprint <<< "${key}" | awk -F: '$1 == "fpr" { print $10 }')
gpg --batch --delete-keys "${fingerprint}"
sudo pacman -Sy
sudo pacman -Rns home_ungoogled_chromium_Arch