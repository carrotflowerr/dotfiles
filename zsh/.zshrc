# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.


source ~/.config/.antidote/antidote.zsh
antidote load
#source ~/.zsh_plugins.zsh
#manage plugins at ~/.zsh_plugins.zsh


export PATH="$PATH:/home/shell/.cargo/bin:/var/lib/flatpak/exports/share:/home/shell/.local/share/flatpak/exports/share"



eval "$(zoxide init zsh)"
#
#Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vi'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Run date
echo "The date is:" $(date)

# Run task thing
task

VIRTUAL_ENV='/mnt/Second/.other/env/bin/activate'
#Aliases

alias ..="cd .."
alias apt-info "apt-cache show"
#alias make="make CC=lacc"
alias cl="clear"
alias cPWD="wl-copy | wl-copy"
alias du="ncdu --color off"
alias e="exit"
alias l="eza --icons"
alias la="eza -a"
alias ll="eza -l"
alias laptop="ssh zimblo@10.0.0.77"
alias log="journalctl -f"
alias ls="exa --icons"
alias maimC="maim --select | xclip -selection clipboard -target image/png"
alias sxiv="nsxiv"

alias playNew="ls --sort oldest | xargs mpv --loop-playlist"
alias playOld="ls --sort newest | xargs mpv --loop-playlist"
alias playLargest="ls --sort size -r | xargs mpv"

alias viewNew="ls --sort oldest | xargs nsxiv"
alias viewOld="ls --sort newest | xargs nsxiv"

alias pstree="ps -ejH"
alias python="python3"
alias rm="rm -iv"
alias cp="cp -iv"
alias mv="mv -iv"
alias startenv="source $VIRTUAL_ENV"
alias sudo="doas"
alias tarD="tar xvf"
alias update="yes | doas apt full-upgrade"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

