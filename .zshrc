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

# Pyenv (https://github.com/pyenv/pyenv#installation)
if [[ -d "$HOME/.pyenv" ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# antigen (https://github.com/zsh-users/antigen)
if [[ -z "$ANTIGEN_HOME" ]]; then
    [[ "$XTRACE" == "verbose" ]] && printf "\nRunning export ANTIGEN_HOME=/opt/homebrew/share/antigen ..."
    export ANTIGEN_HOME="/opt/homebrew/share/antigen"
fi

if [[ -e "$ANTIGEN_HOME/antigen.zsh" ]]; then
    [[ "$XTRACE" == "verbose" ]] && printf "\nRunning source \$ANTIGEN_HOME/antigen.zsh ..."
    source "$ANTIGEN_HOME/antigen.zsh"

    # Enable antigen logging
    # https://github.com/zsh-users/antigen/wiki/Configuration#general
    # ANTIGEN_LOG=$ANTIGEN_HOME/antigen.log

    antigen use oh-my-zsh # http://ohmyz.sh

    if [[ $OSTYPE == *darwin* ]]; then
        antigen bundle https://github.com/robbyrussell/oh-my-zsh plugins/osx
    fi

    antigen bundle https://github.com/robbyrussell/oh-my-zsh plugins/git
    antigen bundle https://github.com/robbyrussell/oh-my-zsh plugins/emoji-clock
    antigen bundle https://github.com/robbyrussell/oh-my-zsh plugins/command-not-found
    antigen bundle https://github.com/zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting.plugin.zsh
    antigen bundle https://github.com/tysonwolker/iterm-tab-colors zsh-tab-colors.plugin.zsh
    antigen bundle https://github.com/rupa/z z.sh
    antigen bundle https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions.plugin.zsh

    DEFAULT_USER=$USER
    POWERLEVEL9K_ALWAYS_SHOW_USER=false
    POWERLEVEL9K_MODE="nerdfont-complete"
    POWERLEVEL9K_VCS_HIDE_TAGS=true
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context status date time_joined virtualenv node_version dir_writable dir vcs newline)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

    POWERLEVEL9K_OS_ICON_BACKGROUND="black"
    POWERLEVEL9K_OS_ICON_FOREGROUND="white"
    POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="black"
    POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="white"
    POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND="red"
    POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND="black"
    POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
    POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="black"
    POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND="red"
    POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND="black"
    POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND="red"
    POWERLEVEL9K_CONTEXT_REMOTE_SUDO_FOREGROUND="black"
    POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
    POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
    POWERLEVEL9K_STATUS_ERROR_BACKGROUND="red"
    POWERLEVEL9K_STATUS_ERROR_FOREGROUND="black"
    POWERLEVEL9K_DATE_BACKGROUND="blue"
    POWERLEVEL9K_DATE_FOREGROUND="black"
    POWERLEVEL9K_TIME_BACKGROUND="blue"
    POWERLEVEL9K_TIME_FOREGROUND="black"
    POWERLEVEL9K_VIRTUALENV_BACKGROUND="cyan"
    POWERLEVEL9K_VIRTUALENV_FOREGROUND="black"
    POWERLEVEL9K_VCS_CLEAN_BACKGROUND="green"
    POWERLEVEL9K_VCS_CLEAN_FOREGROUND="black"
    POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="yellow"
    POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="black"
    POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="yellow"
    POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="black"
    POWERLEVEL9K_NODE_VERSION_BACKGROUND="green"
    POWERLEVEL9K_NODE_VERSION_FOREGROUND="black"
    POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="magenta"
    POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
    POWERLEVEL9K_DIR_HOME_BACKGROUND="magenta"
    POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="magenta"
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
    POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="black"
    POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"

    # https://github.com/romkatv/powerlevel10k#antigen
    antigen theme romkatv/powerlevel10k

    antigen apply
fi

# Git aliases (override/add oh-my-zsh plugins/git)
alias gs="gsb"
alias gds="gdca"
alias gg="git grep --ignore-case --line-number"
if type tig > /dev/null; then
    alias gl="tig --all"
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

# https://github.com/junegunn/fzf
if [[ -d "$HOME/lib/fzf" ]]; then
    source "$HOME/lib/fzf/shell/completion.zsh"
    source "$HOME/lib/fzf/shell/key-bindings.zsh"
fi

# https://github.com/rbenv/rbenv
if type rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# https://the.exa.website
if type exa > /dev/null; then
    alias la="exa --all --blocks --git --group --group-directories-first --header --inode --links --long"
    alias ll="la"
fi

# https://travis-ci.com
if [[ -e "$HOME/.travis/travis.sh" ]]; then
    source $HOME/.travis/travis.sh
fi

# Work
if [[ -e "$HOME/.zshrc_work" ]]; then
    [[ "$XTRACE" == "verbose" ]] && printf "\nRunning source $HOME/.zshrc_work ..."
    source "$HOME/.zshrc_work"
fi

# References
# http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html
# https://robots.thoughtbot.com/the-unix-shells-humble-if
test -e /Users/rishabh/.iterm2_shell_integration.zsh && source /Users/rishabh/.iterm2_shell_integration.zsh || true
