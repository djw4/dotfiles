# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Custom Aliases
[ -f "/usr/local/bin/vis" ] && alias vi=vis     # If vis is installed, alias vi=vis
alias zshrc="vi $HOME/.zshrc"                   # Open this preference file

export GOPATH=$HOME/git/go
export GOROOT=/usr/local/opt/go/libexec
export PY_PATH=$HOME/Library/Python/3.7/bin
export RUBY_PATH=/usr/local/opt/ruby/bin
export PATH=$PY_PATH:$RUBY_PATH:$PATH:$GOPATH/bin:$GOROOT/bin

# Heroku CLI (autocomplete)
HEROKU_AC_ZSH_SETUP_PATH=$HOME/Library/Caches/heroku/autocomplete/zsh_setup
[ -f $HEROKU_AC_ZSH_SETUP_PATH ] && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Travis CLI
TRAVISCLI_SETUP_PATH=$HOME/.travis/travis.sh
[ -f $TRAVISCLI_SETUP_PATH ] && source $TRAVISCLI_SETUP_PATH
