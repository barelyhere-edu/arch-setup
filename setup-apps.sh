#!/bin/bash

# ──────────────────────────────────────────────────────────────────────────────────────────
# Setting up functions for the options
# ──────────────────────────────────────────────────────────────────────────────────────────

# Development packages
install_development_packages(){
    sudo pacman -S base-devel docker code netbeans jdk-openjdk gradle maven ruby rust rustup go dotnet-sdk visualvm pycharm-community-edition intellij-idea-community-edition
}

# Design and 3D modeling packages
install_design_packages() {
    sudo pacman -S darktable blender krita inkscape gimp scribus synfig kdenlive obs-studio ardour audacity
}

# Internet packages
install_internet_packages(){
    sudo pacman -S --needed --noconfirm discord
}

# Productivity packages
install_productivity_packagess(){
    sudo pacman -S --needed --noconfirm okular obsidian cups cups-pdf libreoffice-fresh
}

# Gaming packages
install_gaming_packages() {
    sudo pacman -S --needed --noconfirm steam gamemode
}

# Flatpaks
install_flatpaks() {
    sudo pacman -S --needed --noconfirm flatpak
    flatpak install flathub io.anytype.anytype              # Anytype
    flatpak install flathub org.deskflow.deskflow           # Deskflow
    flatpak install flathub com.github.tchx84.Flatseal      # Flatseal
    flatpak install flathub org.onlyoffice.desktopeditors   # OnlyOffice
    flatpak install flathub com.vysp3r.ProtonPlus           # ProtonPlus
    flatpak install flathub com.spotify.Client              # Spotify
    flatpak install flathub com.jetbrains.WebStorm          # Webstorm
    flatpak install flathub app.zen_browser.zen             # Zen Browser
}


# ──────────────────────────────────────────────────────────────────────────────────────────
# Running script
# ──────────────────────────────────────────────────────────────────────────────────────────
echo -e "List of packages and flatpaks available on apps.md."

# Asking for sudo rights and updating the system
echo -e "Procced with this script. (y/n)${NC}"
read -r script_response
if [[ "$script_response" =~ ^[Yy]$ ]]; then
    sudo -v && sudo pacman -Syyu
else
    echo -e "Script aborted.${NC}"
		exit 1
fi

# Asking about packages
echo -e "Install development packages? Java, Ruby, Rust, Go, .NET and Python development tools. (y/n)${NC}"
read -r dev_response
if [[ "$dev_response" =~ ^[Yy]$ ]]; then
    install_development_packages
else
    echo -e "Installation skipped.${NC}"
fi

echo -e "Install design packages? Darktable, inskcape, gimp, scribus, synfig, ardour, krita and blender. (y/n)${NC}"
read -r design_response
if [[ "$design_response" =~ ^[Yy]$ ]]; then
    install_design_packages
else
    echo -e "Installation skipped.${NC}"
fi

echo -e "Install productivity packages? Okular, obsidian, xournalp, cups, cups-pdf, libreoffice-fresh. (y/n)${NC}"
read -r productivity_response
if [[ "$productivity_response" =~ ^[Yy]$ ]]; then
    install_productivity_packages
else
    echo -e "Installation skipped.${NC}"
fi

echo -e "Install internet packages? Discord. (y/n)${NC}"
read -r internet_response
if [[ "$internet_response" =~ ^[Yy]$ ]]; then
    install_internet_packages
else
    echo -e "Installation skipped.${NC}"
fi

echo -e "Install gaming packages? Steam and gamemode. (y/n)${NC}"
read -r game_response
if [[ "$game_response" =~ ^[Yy]$ ]]; then
    install_gaming_packages
else
    echo -e "Installation skipped.${NC}"
fi

# Asking about flatpaks
echo -e "Install flatpaks? Anytype, Deskflow, Flatseal, OnlyOffice, ProtonPlus, Spotify, Webstorm and Zen Browser (y/n)${NC}"
read -r flatpak_response
if [[ "$flatpak_response" =~ ^[Yy]$ ]]; then
    install_flatpaks
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
