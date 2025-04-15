export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nvim"


export PATH="$PATH:/home/shell/.cargo/bin:/var/lib/flatpak/exports/share:/home/shell/.local/share/flatpak/exports/share:/home/shell/.cargo/bin:/home/shell/scripts"

 
PS1='ζ  '
# ∴ ∑ ζ




#
#Preferred editor for local and remote sessions

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Run date
#echo "The date is:" $(date)
pfetch
task
export MANPAGER='nvim +Man!'

# Run task thing
#task

VIRTUAL_ENV='/mnt/Second/.other/env/bin/activate'
#Aliases

alias apt-info="apt-cache show"
#alias make="make CC=lacc"
alias cl="clear"
alias cppwd="pwd | wl-copy"
#alias du="ncdu --color off"
alias e="exit"
alias ls="eza"
alias ec="emacsclient -c"
alias l="eza"
alias tree="eza -T"
alias la="eza -a"
alias ll="eza -l"
alias laptop="ssh zimblo@10.0.0.77"
alias log="journalctl -f"
#alias maimC="maim --select | xclip -selection clipboard -target image/png"
#
alias sxiv="nsxiv"

alias playNew="ls --sort oldest | xargs mpv --loop-playlist --no-resume-playback"
alias playOld="ls --sort newest | xargs mpv --loop-playlist --no-resume-playback"
alias playLargest="ls --sort size -r | xargs mpv --no-resume-playback"
alias AI="ollama run deepseek-r1:1.5b" 

alias viewNew="ls --sort oldest | xargs nsxiv"

alias viewOld="ls --sort newest | xargs nsxiv"

alias pstree="ps -ejH"
alias python="python3"
#alias rm="rm -iv"
#alias cp="cp -iv"
#alias mv="mv -iv"
alias startenv="source $VIRTUAL_ENV"
alias tarD="tar xvf"
alias fkill="ps -e | fzf | awk '{print $1}' | xargs kill"
#alias update="yes | doas apt full-upgrade"

eval "$(zoxide init bash)"
