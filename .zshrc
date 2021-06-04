if [ -s "${HOME}/.oh-my-zsh/oh-my-zsh.sh" ]; then
  # Source oh-my-zsh--
  export ZSH="/Users/${LOGNAME}/.oh-my-zsh"
  
  # themes-- https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
  # ZSH_THEME="cypher-djw"
  ZSH_THEME="cypher"
  HYPHEN_INSENSITIVE="true"
  DISABLE_AUTO_UPDATE="true"
  ENABLE_CORRECTION="false"
  COMPLETION_WAITING_DOTS="true"
  
  plugins=(git)
  
  source "${ZSH}/oh-my-zsh.sh"
fi

# ZSH Configurations--
setopt localoptions rmstarsilent
unsetopt nomatch

export GITPATH="${HOME}/git"
export PYPATH="${HOME}/Library/Python/3.6/bin"
export RUBYPATH="${HOME}/.gem/ruby/2.3.0/bin"
export LOCALBIN="${HOME}/bin:${HOME}/.bin"
PATH=$LOCALBIN:/usr/local/bin:$PATH:$PYPATH:$RUBYPATH

# Functions/Aliases--
for import in $HOME/.config/*.zsh; do
  source "${import}"
done

export PATH
