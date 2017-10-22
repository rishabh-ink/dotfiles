[[ "$XTRACE" == "verbose" ]] && printf "\nSourcing $HOME/.zshenv ..."

# http://zsh.sourceforge.net/Guide/zshguide02.html#l24
typeset -U path

if [[ $OSTYPE == *darwin* ]]; then
    # https://github.com/tj/n
    if [[ -z "$N_PREFIX" ]]; then
        [[ "$XTRACE" == "verbose" ]] && printf "\nRunning export N_PREFIX=$HOME/n ..."
        export N_PREFIX="$HOME/n"
    fi

    if [[ -d "$HOME/n/bin" ]]; then
        [[ "$XTRACE" == "verbose" ]] && printf "\nAdding $N_PREFIX/bin to path ..."
        path=($path "$N_PREFIX/bin")
    fi
fi

# Add npm_config_prefix to $PATH
if [[ -d $(npm config get prefix) ]]; then
    [[ "$XTRACE" == "verbose" ]] && printf "\nAdding $(npm config get prefix)/bin to path ..."
    path=($path $(npm config get prefix)/bin)
fi
