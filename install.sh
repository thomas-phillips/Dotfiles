#!/bin/bash

if [[ "$#" -eq 0 ]]; then
    echo "No arguments supplied"
    exit 1
fi

while [[ "$#" -gt 0 ]]; do
    case $1 in
    -a | --arch)
        sudo pacman --noconfirm -Sy
        sudo pacman --noconfirm -S --needed base-devel git neofetch neovim luarocks otf-firamono-nerd lazygit \
            yazi go tree-sitter tree-sitter-cli python python-virtualenv python-pip fzf ripgrep wget curl

        git clone https://aur.archlinux.org/paru-bin.git
        cd paru-bin
        yes | makepkg -si

        paru -S nvm
        echo "source /usr/share/nvm/init-nvm.sh" >>~/.bashrc
        # source ~/.bashrc
        source /usr/share/nvm/init-nvm.sh

        # bash --rcfile ~/.bashrc -c "nvm install node"
        nvm install node
        source /usr/share/nvm/init-nvm.sh

        npm install --global yarn
        ;;

    -u | --ubuntu)
        sudo apt-get update && sudo apt-get install -y software-properties-common
        sudo add-apt-get-repository ppa:neovim-ppa/stable
        sudo add-apt-repository ppa:longsleep/golang-backports
        sudo apt-get update
        sudo apt-get install -y git neofetch wget curl unzip fontconfig ffmpeg 7zip jq \
            poppler-utils fd-find ripgrep fzf zoxide imagemagick neovim \
            python3-virtualenv python3-pip golang-go

        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit -D -t /usr/local/bin
        rm -f lazygit lazygit.tar.gz

        TARGET=$(mktemp -d)
        wget --directory-prefix "$TARGET" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraMono.zip
        mkdir -p ~/.fonts
        unzip FiraMono.zip -d ~/.fonts
        fc-cache -fv

        TARGET=$(mktemp -d)
        wget --directory-prefix "$TARGET" https://github.com/sxyazi/yazi/releases/download/v0.4.2/yazi-x86_64-unknown-linux-gnu.zip
        unzip "$TARGET/yazi-x86_64-unknown-linux-gnu.zip" -d "$TARGET"
        sudo install "$TARGET/yazi-x86_64-unknown-linux-gnu/yazi" -D -t /usr/local/bin

        # Rust
        curl https://sh.rustup.rs -sSf | sh -s -- -y
        cargo install --locked tree-sitter-cli

        wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

        source ~/.nvm/nvm.sh
        nvm install node
        npm install --global yarn
        ;;
    *)
        echo "Error unknown flag: $1" >&2
        ;;
    esac
    shift
done
