if status is-interactive
        # Commands to run in interactive sessions can go here
        starship init fish | source
        set -g fish_greeting

        abbr -a update sudo pacman -Syyu
        abbr -a install sudo pacman -S
        abbr -a remove sudo pacman -Rns
        abbr -a sch pacman -Ss

        abbr -a .. cd ..
        abbr -a ... cd ../..

end
