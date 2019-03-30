alias d-run='docker run -it --rm'
alias d-run-bash='docker run -it --rm --entrypoint=/bin/bash'
alias psa='ps -aux | grep'
alias d-im='docker images |grep'
alias del='trash-put'
alias c-dir='rm -rf ./*' 
alias re='rebar3'
alias re-bash='source ~/.bashrc'
alias re-tmux='tmux source-file ~/.tmux.conf'
alias is-ok='echo $?'
alias s-new='subl -n -a .'
alias l='ls -gAh --group-directories-first'
alias hist='history | cut -c 8-'
print_dir_sizes () {
    for D in `find . -maxdepth 1 -type d`
    do
     du -hs "${D}"
    done
}
alias dirsizes='print_dir_sizes'
docker_pretty_ps () {
	docker ps --format '{docker_pretty_ps () {{.Names}}\n\tContainer ID:\t{{.ID}}\n\tImage: \t{{.Image}}\n\tCommand: \t{{.Command}}\n\tCreated: \t{{.CreatedAt}}\n\tStatus: \t{{.Status}}\n\tPorts: \t{{.Ports}}\n\n' | awk '{ if ( $0 ~ /^[a-zA-Z]/ ) printf "%c[1;"(((NR-1)%5)+31)"m"$0"\n", 27; else printf "%c[1;0m"$0"\n", 27; }'
}
alias d-ps='docker_pretty_ps'
alias watch-mem='watch "ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head"'
alias watch-cpu='watch "ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head"'
