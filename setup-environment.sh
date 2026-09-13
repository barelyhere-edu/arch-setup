#!/bin/bash

# ──────────────────────────────────────────────────────────────────────────────────────────
# Setting up functions for the options
# ──────────────────────────────────────────────────────────────────────────────────────────

# GPU options
install_amd() {
    sudo pacman -S --needed --noconfirm mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
}
install_nvidia() {
    sudo pacman -S --needed --noconfirm nvidia-open-dkms lib32-nvidia-utils linux-firmware-nvidia nvidia-settings nvidia-utils
}
# Prompt GPU drivers selection
prompt_gpu_selection() {
    echo -e "GPU drivers, AMD or Nvidia?"${NC}
    echo -e "1) AMD"
    echo -e "2) Nvidia"
    read -r gpu_choice

    case $gpu_choice in
        1)
            install_amd
            ;;
        2)
            install_nvidia
            ;;
        *)
            echo -e "Invalid choice. Please select a valid option."
            prompt_gpu_selection
            ;;
    esac
}

# Desktop environment options
install_kde() {
    echo "Installing KDE Plasma and all KDE applications..."
    sudo pacman -S --needed --noconfirm xorg sddm sddm-kcm wayland
    sudo systemctl enable sddm
    sudo pacman -S --noconfirm plasma kde-applications
    sudo systemctl enable NetworkManager
}
install_gnome() {
    echo "Installing GNOME and applications..."
    sudo pacman -S --needed --noconfirm xorg gdm wayland
    sudo systemctl enable gdm
    sudo pacman -S --noconfirm gnome gnome-extra networkmanager
}
# Prompt Desktop Environment selection
prompt_de_selection() {
    echo -e "Desktop environment: KDE or GNOME?"
    echo -e "1) KDE"
    echo -e "2) GNOME"
    echo -e "3) None"
    read -r de_choice

    case $de_choice in
        1)
            echo -e "You have selected KDE."
            install_kde
            ;;
        2)
            echo -e "You have selected GNOME."
            install_gnome
            ;;
        3)
            echo -e "No Desktop Environment will be installed.${NC}"
            ;;
        *)
            echo -e "Invalid choice. Please select a valid option."
            prompt_de_selection
            ;;
    esac
}

# System packages
install_system_packages(){
    sudo pacman -S --needed --noconfirm base linux-firmware networkmanager fwupd
}

# Essential packages
install_essential_packages(){
    sudo pacman -S --needed --noconfirm ark bash git btop sudo curl less openssh rsync dolphin quota-tools unrar power-profiles-daemon
}

# Server packages
install_server_packages(){
    sudo pacman -S --needed --noconfirm samba smbclient cifs-utils util-linux libnotify
}

# Fonts packages
install_fonts_packages(){
    sudo pacman -S --needed --noconfirm ttf-liberation ttf-jetbrains-mono ttf-font-awesome
}

# Audio/Video packages
install_media_packages(){
    sudo pacman -S --needed --noconfirm alsa-lib alsa-plugins lib32-alsa-lib lib32-alsa-plugins ffmpeg pipewire pipewire-alsa pipewire-jack pipewire-pulse vlc vlc-plugins-all
}

# Check and enable multilib repository
enable_multilib() {
    if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
        echo "Enabling multilib repository..."
        sudo tee -a /etc/pacman.conf > /dev/null <<EOT

[multilib]
Include = /etc/pacman.d/mirrorlist
EOT
        echo "Multilib repository has been enabled."
    else
        echo "Multilib repository is already enabled."
    fi
}

# Enable NetworkManager
enable_networkmanager() {
    sudo systemctl enable NetworkManager
}


# ──────────────────────────────────────────────────────────────────────────────────────────
# Running script
# ──────────────────────────────────────────────────────────────────────────────────────────

# Asking for sudo rights and updating the system
echo -e "Procced with this script. (y/n)${NC}"
read -r script_response
if [[ "$script_response" =~ ^[Yy]$ ]]; then
    sudo -v && sudo pacman -Syyu
else
    echo -e "${RED}Script aborted.${NC}"
		exit 1
fi

# Asking about GPU drivers
prompt_gpu_selection

# Asking about Desktop Environment
prompt_de_selection

# Asking about system packages
echo -e "Install system packages? Base, linux-firmware, networkmanager, fwupd. (y/n)${NC}"
read -r system_response
if [[ "$system_response" =~ ^[Yy]$ ]]; then
    install_system_packages
else
    echo -e "Installation skipped.${NC}"
fi

# Asking about essential packages
echo -e "Install essential packages? ark, bash, git, btop, sudo, curl, less, openssh, rsync, dolphin, quota-tools, unrar and power-profiles-daemon. (y/n)${NC}"
read -r essential_response
if [[ "$essential_response" =~ ^[Yy]$ ]]; then
    install_essential_packages
else
    echo -e "Installation skipped.${NC}"
fi

# Asking about server packages
echo -e "Install server packages? Samba, smbclient, cifs-utils, util-linux and libnotify. (y/n)${NC}"
read -r server_response
if [[ "$server_response" =~ ^[Yy]$ ]]; then
    install_server_packages
else
    echo -e "Installation skipped.${NC}"
fi

# Asking about fonts packages
echo -e "Install fonts packages? ttf-liberation, ttf-jetbrains-mono and ttf-font-awesome. (y/n)${NC}"
read -r fonts_response
if [[ "$fonts_response" =~ ^[Yy]$ ]]; then
    install_fonts_packages
else
    echo -e "Installation skipped.${NC}"
fi

# Asking about audio/video packages
echo -e "Install media packages? Alsa, ffmpeg, pipewire and vlc. (y/n)${NC}"
read -r media_response
if [[ "$media_response" =~ ^[Yy]$ ]]; then
    install_media_packages
else
    echo -e "Installation skipped.${NC}"
fi


# ──────────────────────────────────────────────────────────────────────────────────────────
# END
# ──────────────────────────────────────────────────────────────────────────────────────────
echo -e "Process completed.${NC}"

        sudo rm -R /var/lib/pacman/sync
        sudo pacman -Syyu

# Ask about restart
echo -e "Script completed successfully. Reboot system to apply all changes? (y/n)${NC}"
read -r restart_response
if [[ "$restart_response" =~ ^[Yy]$ ]]; then
    sudo reboot now
else
    echo -e "No restart selected${NC}"
fi
