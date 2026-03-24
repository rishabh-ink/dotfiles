# First-time setup commands

set -o errexit -o nounset -o xtrace -o pipefail

# Symbolic links
ln -sf $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -sf $HOME/dotfiles/.gitattributes $HOME/.gitattributes
ln -sf $HOME/dotfiles/.gitignore $HOME/.gitignore

ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles_work/.zshrc_work $HOME/.zshrc_work
ln -sf $HOME/dotfiles/.zshenv $HOME/.zshenv

ln -sf $HOME/dotfiles/.npmrc $HOME/.npmrc

ln -sf $HOME/dotfiles/.tigrc $HOME/.tigrc

ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc

ln -sf $HOME/dotfiles/.editorconfig $HOME/.editorconfig

ln -sf $HOME/dotfiles/.config/starship.toml $HOME/.config/starship.toml

# macOS
if [[ $OSTYPE == *darwin* ]]; then
    # Preferences
    defaults write com.apple.finder AppleShowAllFiles -boolean true
    defaults write InitialKeyRepeat -float 15.0
    defaults write KeyRepeat -float 2.0
    defaults write ApplePressAndHoldEnabled -bool false
    defaults write com.apple.mouse.tapBehavior -int 0
    defaults com.apple.screencapture type jpg

    # Utilities
    brew install \
        git \
        python \
        tig

    # Apps
    brew install --cask \
        1password \
        alfred \
        android-studio \
        font-fira-code-nerd-font \
        gh \
        istat-menus \
        slack \
        visual-studio-code
fi

# https://github.com/rec/gitz
mkdir $HOME/lib
git clone https://github.com/rec/gitz.git $HOME/lib
