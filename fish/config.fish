
# Lambda prompt
function fish_prompt
    echo "λ "
end

# Disable startup message
set -g fish_greeting ''

# Run pfetch at startup
pfetch

# *.mp4
set -Ua fish_glob_dotfiles

# Aliases


alias cl="clear"
alias cp="cp -iv"
alias du="ncdu"
alias e="exit"
alias ec="emacsclient -c"
alias games="cd /mnt/Third/SSD_Games"
alias l="ls"
alias ll="ls -a"
alias log="journalctl -f"
alias ls="exa"
alias mv="mv -iv"
alias playNew="ls --sort oldest | xargs -d '\n' mpv --loop-playlist"
alias pstree="ps -ejH"
alias python="python3"
alias rm="rm -iv"
alias sudo="doas"
alias tarD="tar xvf"
alias startenv="source $VIRTUAL_ENV"
alias update="yes | doas apt update; doas apt upgrade"

# Virtual python environment
set -x VIRTUAL_ENV "/mnt/Second/.other/env/bin/activate.fish"

# ?
zoxide init fish | source
