# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/martin/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

_JAVA_AWT_WM_NONREPARENTING=1

# Use modern completion system
autoload -Uz compinit
compinit
 
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
 
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# pa que se guarde el hitorial entre sesiones zsh
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# Opciones de historial
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Custom Aliases
# -----------------------------------------------
# bat
alias cat='batcat'
alias catn='bat --style=plain'
alias catnp='bat --style=plain --paging=never'
 
# ls
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'

# pycharm
alias pycharm='/home/martin/.local/share/JetBrains/Toolbox/scripts/pycharm'
alias john='/home/martin/john/run/john'

# plugin del sudo
if [ -f /usr/share/zsh-sudo/sudo.plugin.zsh ]; then
	source /usr/share/zsh-sudo/sudo.plugin.zsh
fi

export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/opt"
export PATH="$PATH:/home/martin/lua-server/bin"
export PATH="$PATH:/home/martin/hashcat-6.2.6"
export PATH="$PATH:/opt/Zotero_linux-x86_64"
export PATH="$PATH:/opt/anyconnect-linux64-4.9.00086/vpn"
export PATH="$PATH:/home/martin/cmake-3.31.3-linux-x86_64/bin"
export PATH="$PATH:/usr/pgadmin4/bin"

export JAVA_HOME="/usr/lib/jvm/java-1.21.0-openjdk-amd64/bin"





#para bajar y subir con altj y altk
bindkey -s "\ej" "^[OA"  # Alt + j
bindkey -s "\ek" "^[OB"  # Alt + k
bindkey -s "\eh" "^[[D"  # Alt + h
bindkey -s "\el" "^[[C"  # Alt + l
# Bind Alt + Backspace to clear the current line
bindkey '\e^?' vi-kill-line  # Alt + Backspace

#Modo vim en zsh
bindkey -v

. "$HOME/.local/bin/env"
