MY_EXTENSIONS=(
    "alefragnani.project-manager"
    "dbaeumer.vscode-eslint"
    "eamodio.gitlens"
    "Equinusocio.vsc-material-theme"
    "esbenp.prettier-vscode"
    "flowtype.flow-for-vscode"
    "ms-python.python"
    "ms-vscode-remote.remote-containers"
    "ms-vscode-remote.remote-ssh"
    "ms-vscode-remote.remote-ssh-edit"
    "ms-vscode-remote.remote-ssh-explorer"
    "ms-vscode-remote.remote-wsl"
    "ms-vscode-remote.vscode-remote-extensionpack"
    "sourcegraph.sourcegraph"
    "zhuangtongfa.Material-theme"
)

for extension in $MY_EXTENSIONS; do
    if type code > /dev/null; then
        code --install-extension $extension
    fi

    if type code-insiders > /dev/null; then
        code-insiders --install-extension $extension
    fi
done
