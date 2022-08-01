# Antigen--
antigen="${HOME}/.config/antigen.zsh"
[[ -d ${HOME}/.config ]] || mkdir ${HOME}/.config
[[ -f "${antigen}" ]] || curl -skL git.io/antigen > "${antigen}"
source "${antigen}"

antigen use oh-my-zsh

antigen bundle "git"
antigen bundle "zsh-users/zsh-completions"
antigen bundle "elstgav/branch-manager"
antigen bundle "tig"
antigen bundle "kubectl"
antigen bundle "aliases"

antigen theme gentoo

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

antigen apply

# ZSH Configurations--
setopt localoptions rmstarsilent
unsetopt nomatch

export GITPATH="${HOME}/git"
export LOCALBIN="${HOME}/bin:${HOME}/.bin"
export GOPATH="${HOME}/go"
export GOROOT="$(brew --prefix golang)/libexec"
export GO111MODULE=on
export XDG_CONFIG_HOME="${HOME}/.config" # For k9s
export PIPENV_VENV_IN_PROJECT=true
export PATH="${LOCALBIN}:/usr/local/bin:${PATH}:${GOPATH}/bin:${GOROOT}/bin"
unset GIT_PAGER

# Completions--
source <(kubectl completion zsh)
eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"

# Aliases--
alias sz="source ${HOME}/.zshrc"
alias k=kubectl
alias kd="k describe"
alias kg="k get -o yaml"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
# alias docker-compose="docker compose"
alias gl="git log --oneline --reverse"
alias r="ranger"
alias k9s="k9s --logoless"
alias lg="lazygit"
