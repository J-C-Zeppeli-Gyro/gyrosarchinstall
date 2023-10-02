sudo echo "[home_ungoogled_chromium_Arch]" >> /etc/pacman.conf
sudo echo "Server = https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/$arch" >> /etc/pacman.conf
sudo key=$(curl -fsSL https://download.opensuse.org/repositories/home:ungoogled_chromium/Arch/$(uname -m)/home_ungoogled_chromium_Arch.key)
sudo fingerprint=$(gpg --quiet --with-colons --import-options show-only --import --fingerprint <<< "${key}" | awk -F: '$1 == "fpr" { print $10 }')
sudo pacman-key --init
sudo pacman-key --add - <<< "${key}"
sudo pacman-key --lsign-key "${fingerprint}"
sudo pacman -Syu home_ungoogled_chromium_Arch/ungoogled-chromium