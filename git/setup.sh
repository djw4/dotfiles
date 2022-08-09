#!/usr/bin/env bash

set -eu

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Setup gitconfig
mkdir -pv $HOME/git/{personal,work}
cat <<EOF >$HOME/.gitconfig
[includeIf "gitdir:~/git/personal/"]
  path = ~/.gitconfig-personal

[includeIf "gitdir:~/git/work/"]
  path = ~/.gitconfig-work

[core]
  pager = delta

[interactive]
  diffFilter = delta --color-only --features=interactive

[delta]
  features = decorations

[delta "interactive"]
  keep-plus-minus-markers = false

[delta "decorations"]
  commit-decoration-style = blue ol
  commit-style = raw
  file-style = omit
  hunk-header-decoration-style = blue box
  hunk-header-file-style = red
  hunk-header-line-number-style = "#067a00"
  hunk-header-style = file line-number syntax
EOF

# Setup gitconfig-personal
cp ${SCRIPT_DIR}/gitconfig-personal $HOME/.gitconfig-personal

# Setup gitconfig-work
if [ ! -f $HOME/.gitconfig-work ]; then
  printf "Git Username: "
  read git_username
  printf "Git Email: "
  read git_email

  cat <<EOF >$HOME/.gitconfig-work
[user]
    name = ${git_username}
    email = ${git_email}
EOF

fi