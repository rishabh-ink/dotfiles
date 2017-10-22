# Locale (https://help.ubuntu.com/community/Locale#List_current_settings)
export LANG="en_US.UTF-8"

# Report 256-color terminal
export TERM="xterm-256color"

# https://unix.stackexchange.com/questions/111718/command-history-in-zsh
HISTSIZE=5000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# http://ohmyz.sh
if [[ -z "$ZSH" ]]; then
    [[ "$XTRACE" == "verbose" ]] && printf "\nRunning export ZSH=$HOME/.oh-my-zsh ..."
    export ZSH="$HOME/.oh-my-zsh"
fi

if [[ -e $ZSH/oh-my-zsh.sh ]]; then
    [[ "$XTRACE" == "verbose" ]] && printf "\nRunning source $HOME/.oh-my-zsh/oh-my-zsh.sh ..."
    source "$HOME/.oh-my-zsh/oh-my-zsh.sh"
else
    printf "\nOops! http://ohmyz.sh not found"
fi

# zplug (https://github.com/zplug/zplug)
if [[ -z "$ZPLUG_HOME" ]]; then
    [[ "$XTRACE" == "verbose" ]] && printf "\nRunning export ZPLUG_HOME=/usr/local/opt/zplug ..."
    export ZPLUG_HOME="/usr/local/opt/zplug"
fi

if [[ -e $ZPLUG_HOME/init.zsh ]]; then
    [[ "$XTRACE" == "verbose" ]] && printf "\nRunning source $HOME/.oh-my-zsh/oh-my-zsh.sh ..."
    source "$ZPLUG_HOME/init.zsh"

    # zplug (https://github.com/zplug/zplug) list plugins
    zplug "rishabhsrao/iterm-tab-colors" # https://github.com/rishabhsrao/iterm-tab-colors
    zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, \
        hook-load:" \
            POWERLEVEL9K_MODE='nerdfont-complete'; \
            POWERLEVEL9K_SHORTEN_DIR_LENGTH=3; \
            POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir vcs); \
            POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv node_version time) \
        " # https://github.com/bhilburn/powerlevel9k/wiki/Show-Off-Your-Config#tunnckocore-configuration
    zplug "plugins/git", from:oh-my-zsh # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
    zplug "plugins/emoji-clock", from:oh-my-zsh # https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/emoji-clock/emoji-clock.plugin.zsh
    zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]" # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#osx
    zplug "plugins/z", from:oh-my-zsh # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/z

    zplug "zplug/zplug", hook-build:"zplug --self-manage"

    # zplug (https://github.com/zplug/zplug) install plugins
    if ! zplug check --verbose; then
        printf "\nInstall? [y/N]: "
            if read -q; then
                zplug install
            fi
    fi

    # zplug (https://github.com/zplug/zplug) load plugins
    zplug load
else
    printf "\nOops! https://github.com/zplug/zplug not found"
fi

# Git aliases (override/add oh-my-zsh plugins/git)
alias gs="gsb"
alias gl="git log --graph --pretty='%C(magenta)%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias gds="gdca"
alias gg="git grep --ignore-case --line-number"
function gshow {
    if [[ -z "$1" ]]; then
        git diff-tree --no-commit-id --name-only -r $1 && git show --patch $1
    fi
}

# https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md
# https://github.com/sindresorhus/trash-cli
if type trash > /dev/null; then
        alias rm="trash"
    else
        alias rm="rm -i"
fi

# Pretty grep (https://www.gnu.org/software/grep/manual/grep.html)
alias grep="grep --line-number --color"

# Pretty tree (https://linux.die.net/man/1/tree)
alias tree="tree -CDAshpug"

# https://coderwall.com/p/lzgryq/cat-with-syntax-highlighting
# https://stackoverflow.com/questions/7522712/how-to-check-if-command-exists-in-a-shell-script
function ccat {
    if [[ -z "$@" ]]; then
        if type pygmentize > /dev/null; then
            cat --number $@ | pygmentize -O style=monokai -f console256 -g
        else
            print "Oops! http://pygments.org/docs/cmdline not found"
        fi
    fi
}

# Work
if [[ -e "$HOME/.zshrc_work" ]]; then
    [[ "$XTRACE" == "verbose" ]] && printf "\nRunning source $HOME/.zshrc_work ..."
    source "$HOME/.zshrc_work"
fi

# References
# http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html
# https://robots.thoughtbot.com/the-unix-shells-humble-if
