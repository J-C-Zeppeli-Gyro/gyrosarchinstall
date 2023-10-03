echo "[home_ungoogled_chromium_Arch]" >> /etc/pacman.conf
echo "Server = https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/$arch" >> /etc/pacman.conf
key=$(curl -fsSL https://download.opensuse.org/repositories/home:ungoogled_chromium/Arch/$(uname -m)/home_ungoogled_chromium_Arch.key)
fingerprint=$(gpg --quiet --with-colons --import-options show-only --import --fingerprint <<< "${key}" | awk -F: '$1 == "fpr" { print $10 }')
pacman-key --init
pacman-key --add - <<< "${key}"
pacman-key --lsign-key "${fingerprint}"
pacman -Syu home_ungoogled_chromium_Arch/ungoogled-chromium