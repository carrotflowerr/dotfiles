
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
alias ect="emacsclient -c -nw"
alias games="cd /mnt/Third/SSD_Games"
alias l="ls"
alias laptop="ssh zimblo@10.0.0.77"
alias ll="ls -a"
alias log="journalctl -f"
alias ls="exa"
alias maimC="maim --select | xclip -selection clipboard -target image/png"
alias mv="mv -iv"
alias playOld="ls --sort newest | xargs -d '\n' mpv --loop-playlist"
alias playNew="ls --sort oldest | xargs -d '\n' mpv --loop-playlist"

alias viewOld="ls --sort newest | xargs -d '\n' sxiv"
alias viewNew="ls --sort oldest | xargs -d '\n' sxiv"

alias pstree="ps -ejH"
alias python="python3"
alias rm="rm -iv"
alias startenv="source $VIRTUAL_ENV"
alias sudo="doas"
alias tarD="tar xvf"
alias tmux="zellij"
alias update="yes | doas apt update; doas apt upgrade"

# Virtual python environment
set -x VIRTUAL_ENV "/mnt/Second/.other/env/bin/activate.fish"

function fzf_history
    commandline -r (history | fzf)
end

bind \cr fzf_history





# ?
zoxide init fish | source
