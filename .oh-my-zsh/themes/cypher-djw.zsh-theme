# Based on evan's prompt -> minor edits by djw
# Shows the exit status of the last command if non-zero
# Uses "#" instead of "»" when running with elevated privileges
PROMPT="%{${fg_bold[yellow]}%}» %{${fg[red]}%}%1~%(0?. . %{${fg[red]}%}%? )%{${fg[blue]}%}$%{${reset_color}%} "
