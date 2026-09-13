# Arch Packages

## Useful Commands

- `pacstrap [root] [pkgs...]` (Install packages into new root)
- `pacman -S [pkgs...]` (Install packages)
- `pacman -Syu` (Update everything)
- `pacman -Q` (List installed packages)
- `pacman -Ql [pkg]` (List files in a package)
- `pacman -Qo [file]` (Find out which package owns a file)

## Packages

### Base

- [`base`](https://archlinux.org/packages/core/any/base/) - Basic Utilities.
- [`linux`](https://archlinux.org/packages/core/x86_64/linux/) - Kernel.
- [`linux-firmware`](https://archlinux.org/packages/core/any/linux-firmware/) - Firmware.
- [`networkmanager`](https://archlinux.org/packages/extra/x86_64/networkmanager/) - Networking.
- [`fwupd`](https://archlinux.org/packages/extra/x86_64/fwupd/) - Simple daemon to allow session software to update firmware.

### Environment

- [`xorg`](https://www.x.org/) - An open source implementation of the X Window System.
- [`wayland`](https://archlinux.org/packages/extra/x86_64/wayland/) - A computer display server protocol.

- [`KDE`](https://kde.org/)
  - [`plasma`](https://kde.org/plasma-desktop/) - Customizable Desktop Environment
  - [`kde-applications-meta`](https://archlinux.org/packages/extra/any/kde-applications-meta/) - KDE Applications.

  - [`sddm`](https://archlinux.org/packages/extra/x86_64/sddm/) - QML based X11 and Wayland display manager.
  - [`sddm-kcm`](https://archlinux.org/packages/extra/x86_64/sddm-kcm/) - KDE Config Module for SDDM.

- [`GNOME`](https://www.gnome.org/)
  - [`gnome`](https://www.gnome.org) - The default experience across Linux distros.
  - [`gnome-extra`](https://archlinux.org/groups/x86_64/gnome-extra/) - Extra tools for gnome.

  - [`gdm`](https://archlinux.org/packages/gnome-unstable/x86_64/gdm/) - Display manager and login screen.

### Terminal

- [`fzf`](https://archlinux.org/packages/extra/x86_64/fzf/) - Command-line fuzzy finder.
- [`fastfetch`](https://archlinux.org/packages/extra/x86_64/fastfetch/) - A feature-rich and performance oriented neofetch like system information tool.
- [`fish`](https://archlinux.org/packages/extra/x86_64/fish/) - Smart and user friendly shell intended mostly for interactive use.
- [`fisher`](https://archlinux.org/packages/extra/any/fisher/) - A package manager for the fish shell.
- [`jq`](https://archlinux.org/packages/extra/x86_64/jq/) - Command-line JSON processor
- [`kitty`](https://archlinux.org/packages/extra/x86_64/kitty/) - A modern, hackable, featureful, OpenGL-based terminal emulator.
- [`kitty-shell-integration`](https://archlinux.org/packages/extra/x86_64/kitty-shell-integration/) - Shell integration scripts for kitty, an OpenGL-based terminal emulator.
- [`kitty-terminfo`](https://archlinux.org/packages/extra/x86_64/kitty-terminfo/) - Terminfo for kitty, an OpenGL-based terminal emulator.
- [`rlwrap`](https://archlinux.org/packages/extra/x86_64/rlwrap/) - Adds readline-style editing and history to programs.
- [`unzip`](https://archlinux.org/packages/extra/x86_64/unzip/) - For extracting and viewing files in .zip archives.
- [`trash-cli`](https://archlinux.org/packages/extra/any/trash-cli/) - Command line trashcan (recycle bin) interface.
- [`tree`](https://archlinux.org/packages/extra/x86_64/tree/) - A directory listing program displaying a depth indented list of files.
- [`whois`](https://archlinux.org/packages/extra/x86_64/whois/) - Intelligent WHOIS client.
- [`wget`](https://archlinux.org/packages/extra/x86_64/wget/) - Network utility to retrieve files from the web.
- [`zip`](https://archlinux.org/packages/extra/x86_64/zip/) - Compressor/archiver for creating and modifying zipfiles.

### Development

- [`base-devel`](https://archlinux.org/packages/core/any/base-devel/) - Basic tools to build Arch Linux packages.
- [`code`](https://archlinux.org/packages/extra/x86_64/code/) - The Open Source build of Visual Studio Code (vscode) editor.
- [`docker`](https://archlinux.org/packages/extra/x86_64/docker/) - Pack, ship and run any application as a lightweight container.
- [`dotnet-sdk`](https://archlinux.org/packages/extra/x86_64/dotnet-sdk/) - The .NET Core SDK.
- [`netbeans`](https://archlinux.org/packages/extra/any/netbeans/) - IDE for Java, HTML5, PHP, Groovy, C and C++.
- [`go`](https://archlinux.org/packages/extra/x86_64/go/) - Core compiler tools for the Go programming language.
- [`gradle`](https://archlinux.org/packages/extra/any/gradle/) - Powerful build system for the JVM.
- [`intellij-idea-community-edition`](https://archlinux.org/packages/extra/x86_64/intellij-idea-community-edition/) - IDE for Java.
- [`jdk-openjdk`](https://archlinux.org/packages/extra/x86_64/jdk-openjdk/) - OpenJDK Java development kit.
- [`maven`](https://archlinux.org/packages/extra/any/maven/) - Java project management and project comprehension tool.
- [`pycharm-community-edition`](https://archlinux.org/packages/extra/x86_64/pycharm-community-edition/) - Python IDE.
- [`ruby`](https://archlinux.org/packages/extra/x86_64/ruby/) - An object-oriented language for quick and easy programming.
- [`rust`](https://archlinux.org/packages/extra/x86_64/rust/) - Systems programming language focused on safety, speed and concurrency.
- [`rustup`](https://archlinux.org/packages/extra/x86_64/rustup/) - The Rust toolchain installer.
- [`visualvm`](https://archlinux.org/packages/extra/x86_64/visualvm/) - Visual tool integrating several commandline JDK tools and lightweight profiling capabilities.

### Design and 3D modeling

- [`ardour`](https://archlinux.org/packages/extra/x86_64/ardour/) - Professional-grade digital audio workstation.
- [`blender`](https://archlinux.org/packages/extra/x86_64/blender/) - A fully integrated 3D graphics creation suite.
- [`darktable`](https://archlinux.org/packages/extra/x86_64/darktable/) - Utility to organize and develop raw images.
- [`gimp`](https://archlinux.org/packages/extra/x86_64/gimp/) - GNU Image Manipulation Program.
- [`inkscape`](https://archlinux.org/packages/extra/x86_64/inkscape/) - Professional vector graphics editor.
- [`scribus`](https://archlinux.org/packages/extra/x86_64/scribus/) - Desktop publishing software.
- [`synfig`](https://archlinux.org/packages/extra/x86_64/synfig/) - Professional vector animation program (CLI renderer only).

### Gaming

- [`steam`](https://archlinux.org/packages/multilib/x86_64/steam/) - Valve's digital software delivery system.
- [`gamemode`](https://archlinux.org/packages/extra/x86_64/gamemode/) - A daemon/lib combo that allows games to request a set of optimisations be temporarily applied to the host OS.

## Flatpaks

- [`Anytype`](https://flathub.org/en/apps/io.anytype.anytype) - The everything app for those who celebrate trust and autonomy.
- [`Deskflow`](https://flathub.org/en/apps/org.deskflow.deskflow) - Software Keyboard and mouse sharing.
- [`Flatseal`](https://flathub.org/en/apps/com.github.tchx84.Flatseal) - Manage Flatpak permissions.
- [`ONLYOFFICE`](https://flathub.org/en/apps/org.onlyoffice.desktopeditors) - Office productivity suite.
- [`ProtonPlus`](https://flathub.org/en/apps/com.vysp3r.ProtonPlus) - Manage Proton, Wine, DXVK, and VKD3D tools for Linux game launchers.
- [`Spotify`](https://flathub.org/en/apps/com.spotify.Client) - Online music streaming service.
- [`Webstorm`](https://flathub.org/en/apps/com.jetbrains.WebStorm) - JavaScript and TypeScript IDE.
- [`Zen Browser`](https://flathub.org/en/apps/app.zen_browser.zen) - Stay focused, browse faster.
