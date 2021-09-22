# Based on evan's prompt -> minor edits by djw
# - Shows the exit status of the last command if non-zero
# - Uses "#" instead of "»" when running with elevated privileges
# - Shows the parent directory up to a depth of n - 3 by default
# - If the current directory is a git repo, show the selected branch
    name on the right hand side.

SHOW_DEPTH="3"

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%f'
zstyle ':vcs_info:*' enable git

PROMPT="%{${fg_bold[yellow]}%}» %{${fg[red]}%}%${SHOW_DEPTH}~%(0?. . %{${fg[red]}%}%? )%{${fg[blue]}%}$%{${reset_color}%} "
