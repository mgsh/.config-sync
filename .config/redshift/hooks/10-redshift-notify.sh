#!/bin/bash

export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
case $1 in
period-changed)
    logger -i -t "10-redshift-notify.sh" "Redshift: Period changed from $2 to $3"
    case $3 in
    night)
        sed -i 's/Solarized Light/Solarized Dark/' /home/magesh/.config/Code/User/settings.json
        cat /home/magesh/.config/xfce4/terminal/terminalrc.dark | sponge /home/magesh/.config/xfce4/terminal/terminalrc
        ln -svnf /home/magesh/.config/alacritty/themes/themes/solarized_dark.yaml /home/magesh/.config/alacritty/themes/themes/solarized.yaml
        ln -svnf /home/magesh/.local/etc/k9s/solarized_dark.yml /home/magesh/.config/k9s/skin.yml
        gsettings set org.xfce.mousepad.preferences.view color-scheme solarized-dark
        for s in $(ls -1 ${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/nvim.*.0); do
            nvim --server "$s" --remote-send '<C-\><C-N>:set background=dark<CR>'
        done
        echo "dark" > /home/magesh/.config/nvim/background
        ;;
    daytime)
        sed -i 's/Solarized Dark/Solarized Light/' /home/magesh/.config/Code/User/settings.json
        cat /home/magesh/.config/xfce4/terminal/terminalrc.light | sponge /home/magesh/.config/xfce4/terminal/terminalrc
        ln -svnf /home/magesh/.config/alacritty/themes/themes/solarized_light.yaml /home/magesh/.config/alacritty/themes/themes/solarized.yaml
        ln -svnf /home/magesh/.local/etc/k9s/solarized_light.yml /home/magesh/.config/k9s/skin.yml
        gsettings set org.xfce.mousepad.preferences.view color-scheme solarized-light
        for s in $(ls -1 ${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/nvim.*.0); do
            nvim --server "$s" --remote-send '<C-\><C-N>:set background=light<CR>'
        done
        echo "light" > /home/magesh/.config/nvim/background
        ;;
    esac
    ;;
esac
