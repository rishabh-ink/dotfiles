# First-time setup commands

set -o errexit -o nounset -o xtrace -o pipefail

# macOS personal preferences
if [[ $OSTYPE == *darwin* ]]; then
    defaults -currentHost write -globalDomain com.apple.finder AppleShowAllFiles -boolean true
    defaults -currentHost write -globalDomain InitialKeyRepeat -float 15.0
    defaults -currentHost write -globalDomain KeyRepeat -float 2.0
    defaults -currentHost write -globalDomain ApplePressAndHoldEnabled -bool false
    defaults -currentHost write -globalDomain com.apple.mouse.tapBehavior -int 0
fi

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
