# Shell scripts - Post-install Arch

Bash scripts for faster setup. Specific to my daily setup/apps.

### Package list - [Apps](apps.md)

- Developenment
- Design
- 3D modeling
- Gaming

### Environment

- KDE
- Gnome

### Terminal

- Kitty
- Fish
- Starship
- Fastfetch

## Usage

After installing **Arch Linux** follow these steps:

1. Update the system and install Git.

   ```
   sudo pacman -Syyu git
   ```

2. Clone this repository:

   ```
   git clone https://gitlab.com/edu-barelyhere/arch-setup.git
   ```

3. Change into the directory:

   ```
   cd arch-setup
   ```

4. Make the script executable:

   ```
   chmod +x setup-chosen_script.sh
   ```

5. Run the script:

   ```
   ./setup-chosen_script.sh
   ```
