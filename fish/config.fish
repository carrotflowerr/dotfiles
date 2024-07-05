
# Lambda prompt
function fish_prompt
    echo "λ "
end

# Disable startup message
set -g fish_greeting ''

# Run pfetch at startup
#pfetch
task
# *.mp4
set -Ua fish_glob_dotfiles

# Walk
function lk
  set loc (walk $argv); and cd $loc;
end


# Aliases

# this goes in ssh config
#alias ec="emacsclient -c"
#alias ect="emacsclient -c -nw"
alias apt-info "apt-cache show"
alias cl="clear"
alias cp="cp -iv"
alias du="ncdu --color off"
alias e="exit"
alias games="cd /mnt/Third/SSD_Games"
alias l="eza --icons"
alias la="eza -a"
alias laptop="ssh zimblo@10.0.0.77"
alias log="journalctl -f"
alias ls="exa --icons"
alias maimC="maim --select | xclip -selection clipboard -target image/png"
alias mv="mv -iv"

alias playNew="ls --sort oldest | xargs -d '\n' mpv --loop-playlist"
alias playOld="ls --sort newest | xargs -d '\n' mpv --loop-playlist"

alias pstree="ps -ejH"
alias python="python3"
alias rm="rm -iv"
alias startenv="source $VIRTUAL_ENV"
alias sudo="doas"
alias tarD="tar xvf"
alias tmux="zellij"
alias update="yes | doas apt full-upgrade"

alias viewNew="ls --sort oldest | xargs -d '\n' sxiv"
alias viewOld="ls --sort newest | xargs -d '\n' sxiv"

# Virtual python environment
set -x VIRTUAL_ENV "/mnt/Second/.other/env/bin/activate.fish"

function fzf_history
    commandline -r (history | fzf)
end

bind \cr fzf_history

# Defaults
set $EDITOR = "nvim"
export PATH="$HOME/.cargo/bin:$PATH"

# ?
zoxide init fish | source
