#!/bin/bash


# ──────────────────────────────────────────────────────────────────────────────────────────
# Setting up functions for the options
# ──────────────────────────────────────────────────────────────────────────────────────────

# Basic packages
install_cli_tools() {
    sudo pacman -S --needed --noconfirm fzf jq rlwrap unzip trash-cli tree whois wget zip
}

# Creating config files
config_kitty(){
    sudo pacman -S --need --noconfirm kitty kitty-shell-integration kitty-terminfo
    cp -R .config/kitty $HOME/.config
}
config_fish(){
    sudo pacman -S --need --noconfirm fish fisher
    cp -R .config/fish $HOME/.config
}
config_starship(){
    curl -sS https://starship.rs/install.sh | sh
    starship preset pure-preset -o "$HOME/.config/starship.toml"
}
config_fastfetch(){
    sudo pacman -S --need --noconfirm fastfetch
    cp -R .config/fastfetch $HOME/.config
}

# Setup logos, ascli and themes
copy_files(){
    cp -R .config/tool-configs $HOME/.config
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

# Asking about CLI tools
echo -e "Install CLI tools packages? fzf, fastfetch, fish, fisher, jq, kitty, kitty-shell-integration, kitty-terminfo, rlwrap, unzip, trash-cli, tree, whois, wget and zip. (y/n)${NC}"
read -r cli_response
if [[ "$cli_response" =~ ^[Yy]$ ]]; then
    install_cli_tools
else
    echo -e "Installation skipped.${NC}"
fi

# Asking about Kitty
echo -e "Install and setup Kitty? (y/n)${NC}"
read -r kitty_response
if [[ "$kitty_response" =~ ^[Yy]$ ]]; then
    config_kitty
else
    echo -e "Installation and setup skipped.${NC}"
fi

# Asking about Fish
echo -e "Install and setup Fish? (y/n)${NC}"
read -r fish_response
if [[ "$fish_response" =~ ^[Yy]$ ]]; then
    config_fish
else
    echo -e "Installation and setup skipped.${NC}"
fi

# Asking about Starship
echo -e "Install Startship and set it to the Pure Preset? (y/n)${NC}"
read -r starship_response
if [[ "$starship_response" =~ ^[Yy]$ ]]; then
    config_starship
else
    echo -e "Installation and setup skipped.${NC}"
fi

# Asking about Fastfetch
echo -e "Install and setup Fastfetch? (y/n)${NC}"
read -r fastfetch_response
if [[ "$fastfetch_response" =~ ^[Yy]$ ]]; then
    config_fastfetch
else
    echo -e "Installation and setup skipped.${NC}"
fi

# Asking about config files
echo -e "Copy old config files? (y/n)${NC}"
read -r files_response
if [[ "$files_response" =~ ^[Yy]$ ]]; then
    copy_files
else
    echo -e "Files skipped.${NC}"
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
