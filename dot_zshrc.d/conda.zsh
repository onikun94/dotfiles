# Conda is optional while Python versions are managed by mise.
CONDA_ROOT="/opt/homebrew/Caskroom/miniforge/base"
if [[ -x "${CONDA_ROOT}/bin/conda" ]]; then
    __conda_setup="$("${CONDA_ROOT}/bin/conda" shell.zsh hook 2>/dev/null)"
    if [[ $? -eq 0 ]]; then
        eval "$__conda_setup"
    elif [[ -r "${CONDA_ROOT}/etc/profile.d/conda.sh" ]]; then
        source "${CONDA_ROOT}/etc/profile.d/conda.sh"
    fi
    unset __conda_setup
fi
