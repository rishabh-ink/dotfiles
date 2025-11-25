# References:
# 1. https://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html
# 2. https://robots.thoughtbot.com/the-unix-shells-humble-if

# Locale (https://help.ubuntu.com/community/Locale#List_current_settings)
export LANG="en_US.UTF-8"

# Report 256-color terminal
export TERM="xterm-256color"

# https://askubuntu.com/questions/441744/pressing-enter-produces-m-instead-of-a-newline
stty icrnl

# https://unix.stackexchange.com/questions/111718/command-history-in-zsh
HISTSIZE=5000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Add `python`, etc. aliases on macOS
if [[ $OSTYPE == *darwin* ]]; then
    export PATH="/opt/homebrew/opt/python/libexec/bin":$PATH
fi

# Pyenv (https://github.com/pyenv/pyenv#installation)
if [[ -d "$HOME/.pyenv" ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# https://ohmyposh.dev/
eval "$(oh-my-posh init zsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/tags/v27.6.0/themes/gmay.omp.json)"

# antigen (https://github.com/zsh-users/antigen)
if [[ -z "$ANTIGEN_HOME" ]]; then
    export ANTIGEN_HOME="/opt/homebrew/share/antigen"
fi

if [[ -e "$ANTIGEN_HOME/antigen.zsh" ]]; then
    source "$ANTIGEN_HOME/antigen.zsh"

    # Enable antigen logging
    # https://github.com/zsh-users/antigen/wiki/Configuration#general
    # ANTIGEN_LOG=$ANTIGEN_HOME/antigen.log

    if [[ $OSTYPE == *darwin* ]]; then
        antigen bundle https://github.com/robbyrussell/oh-my-zsh plugins/osx
    fi

    antigen bundle https://github.com/zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting.plugin.zsh
    antigen bundle https://github.com/tysonwolker/iterm-tab-colors zsh-tab-colors.plugin.zsh
    antigen bundle https://github.com/rupa/z z.sh
    antigen bundle https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions.plugin.zsh

    antigen apply
fi

# https://github.com/rec/gitz
if [[ -d "$HOME/lib/gitz" ]]; then
    alias gs="$HOME/lib/gitz/git-st"
    alias gw="$HOME/lib/gitz/git-when"
fi

# Personal Git aliases
alias gd="git diff"
alias gds="git diff --staged"
alias gco="git checkout"

if type tig > /dev/null; then
    alias gl="tig --first-parent"
    alias gll="tig --all"
fi

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
# https://github.com/sindresorhus/trash-cli
# if type trash > /dev/null; then
#         alias rm="trash"
#     else
#         print "Install trash-cli (https://github.com/sindresorhus/trash-cli) for an improved experience"
#         alias rm="rm -i"
# fi

# Pretty grep (https://www.gnu.org/software/grep/manual/grep.html)
alias grep="grep --line-number --color"

# Pretty tree (https://linux.die.net/man/1/tree)
alias tree="tree -CDAshpug"

# https://coderwall.com/p/lzgryq/cat-with-syntax-highlighting
if type pygmentize > /dev/null; then
        alias ccat="pygmentize -f terminal256 -g"
    else
        alias ccat="cat --number $@"
fi

# https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
if type fzf > /dev/null; then
    source <(fzf --zsh)
fi

# https://github.com/rbenv/rbenv
if type rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# https://github.com/eza-community/eza
if type eza > /dev/null; then
    alias la="eza --all --git --group --group-directories-first --header --inode --links --long"
    alias ll="la"
fi

# https://github.com/nvm-sh/nvm
if [[ $OSTYPE == *darwin* ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

# Work
if [[ -e "$HOME/.zshrc_work" ]]; then
    source "$HOME/.zshrc_work"
fi

# https://iterm2.com/documentation-shell-integration.html
if [[ -e "$HOME/.iterm2_shell_integration.zsh" ]]; then
    source $HOME/.iterm2_shell_integration.zsh
fi
