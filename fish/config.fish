
# Lambda prompt
function fish_prompt
    echo "λ "
end

# Disable startup message
set -g fish_greeting ''

# Run pfetch at startup
pfetch

# Aliases
alias cl="clear"
alias code="cd ~/Documents/code"
alias cp="cp -iv"
alias du="ncdu"
alias e="exit"
alias games="cd /mnt/Third/SSD_Games"
alias l="ls"
alias ll="ls -a"
alias log="journalctl -f"
alias ls="exa"
alias mv="mv -iv"
alias pstree="ps -ejH"
alias python="python3"
alias rm="rm -iv"
alias tarD="tar xvf"
alias update="yes | sudo apt update; yes | sudo apt upgrade"

# Virtual python environment
set VIRTUAL_ENV "/mnt/Second/.other/env/bin/activate"

# ?
zoxide init fish | source
