# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

PROMPT_COMMAND='history -a'
export HISTCONTROL=ignorespace:erasedups
export HISTIGNORE="ls:ps:history"
shopt -s cmdhist
export ERL_AFLAGS="-kernel shell_history enabled"

. /home/smilart/0_workDir/1_Intall/z/z.sh
