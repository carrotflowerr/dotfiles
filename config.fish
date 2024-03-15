if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_prompt
    echo "λ "
end

alias cl="clear"
alias code="cd ~/Documents/code"
alias l="ls"
alias ll="ls -a"
#alias dir='dir --color=auto'
#alias du="du -h -c"
alias du="ncdu"
alias e="exit"
#alias egrep='egrep --color=auto'
#alias fgrep='fgrep --color=auto'
alias games="cd /mnt/Third/SSD_Games"
#alias grep='grep --color=auto'
#alias la='ls -A'
#alias ll='ls -l'
#alias l='ls -CF'
alias log="journalctl -f"
#alias ls='ls --color=auto'
alias python="python3"
alias startenv="source /mnt/Second/.other/env/bin/activate"
alias update="yes | sudo nala update; yes | sudo nala upgrade"
zoxide init fish | source
