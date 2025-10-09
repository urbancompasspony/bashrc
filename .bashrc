# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#-----------------------------------------------
# Configurações Gerais
#-----------------------------------------------

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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#========================
# Colors for Terminal
#========================

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

NONE="\[\033[0m\]" # Eliminar as Cores (deixar padrão)

## Cores de Fonte
W="\[\033[0;37m\]" # White (Branco)

R="\[\033[0;31m\]" # Red (Vermelho)
G="\[\033[0;32m\]" # Green (Verde)
B="\[\033[0;34m\]" # Blue (Azul)

C="\[\033[0;36m\]" # Cyan (Ciano - Azul Claro)
M="\[\033[0;35m\]" # Magenta (Vermelho Claro)
Y="\[\033[0;33m\]" # Yellow (Amarelo)
K="\[\033[0;30m\]" # Black (Preto)

## Efeito Negrito (bold) e cores
BW="\[\033[1;37m\]" # Bold+White (Negrito+Branco)
BR="\[\033[1;31m\]" # Bold+Red (Negrito+Vermelho)
BG="\[\033[1;32m\]" # Bold+Green (Negrito+Verde)
BB="\[\033[1;34m\]" # Bold+Blue (Negrito+Azul)
BC="\[\033[1;36m\]" # Bold+Cyan (Negrito+Ciano - Azul Claro)
BM="\[\033[1;35m\]" # Bold+Magenta (Negrito+Vermelho Claro)
BY="\[\033[1;33m\]" # Bold+Yellow (Negrito+Amarelo)
BK="\[\033[1;30m\]" # Bold+Black (Negrito+Preto)

## Cores de fundo (backgroud)
BGW="\[\033[47m\]" # White (Branco)
BGR="\[\033[41m\]" # Red (Vermelho)
BGG="\[\033[42m\]" # Green (Verde)
BGB="\[\033[44m\]" # Blue (Azul)
BGC="\[\033[46m\]" # Cyan (Ciano - Azul Claro)
BGM="\[\033[45m\]" # Magenta (Vermelho Claro)
BGY="\[\033[43m\]" # Yellow (Amarelo)
BGK="\[\033[40m\]" # Black (Preto)

# Uncomment to turn on!
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

if [ `whoami` != 'root' ]; then
  PS1="$BK┌─$BK[$BB\u$BK]$BR@$BK[$BB\h$BK]$BR:$BK[$BC\w$BK] $BK \n$BK└──╼ $BR$ $NONE"
else
  PS1="$BK┌─$BK[$BR\u$BK]$BR@$BK[$BR\h$BK]$BR:$BK[$BY\w$BK] $BK \n$BK└──╼ $BR$ $NONE"
fi

# BKP OLD ONES

#PS1="$BG┌─[$BC\u$BG]$BR@$BG[$BB\h$BG]:$BG[$BY\w$BG] \n└──╼ $ $NONE"
#PS1="$BK┌─$BK[$BR\u$BK]$BR@$BK[$BR\h$BK]$BR:$BK[$BR\w$BK] $BK \n└──╼ $BR$ $NONE"
#PS1="$BR┌─[$BG\u$BR]$BY@$BR[$BW${HOSTNAME%%.*}$BR]$B:\w\n$BR└──>$BG Ω $NONE"
#PS1="\e[01;31m┌─[\e[01;35m\u\e[01;31m]──[\e[00;37m${HOSTNAME%%.*}\e[01;32m]:\w$\e[01;31m\n\e[01;31m└──\e[01;36m>>\e[00m"
#PS1="┌─[\[\e[34m\]\u\[\e[0m\]][\[\e[34m\]\h\[\e[0m\]][\[\e[34m\]\w\[\e[0m\]]\n└─╼ "
#PS1="$G┌─[$BR\u$G]$BY@$G[$BW${HOSTNAME%%.*}$G]$B:\w\n$G└──>$BR \\$ $NONE"

# Default
#PS1='[\u@\h \W]\$ '

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
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

alias lsblk='lsblk -f'
alias rsyncf='rsync -aHAXv --numeric-ids --sparse'

function dockermount() {
  docker ps -q | xargs docker inspect --format '{{.Name}}{{range .Mounts}}
  {{.Source}} -> {{.Destination}}{{end}}
' | grep -E "$1|^/"
}

function srv {
  SCRIPT="$HOME/.srv"
  URL="https://srv.linuxuniverse.com.br"
  if ping -c 1 -W 2 google.com &>/dev/null; then
    if curl -sSL "$URL" -o "$SCRIPT" && [ -s "$SCRIPT" ]; then
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
alias iplan="hostname -I | awk '{print $1}'"
alias ipwan="dig @resolver4.opendns.com myip.opendns.com +short"

# for MATE DE
alias reset-panel="mate-panel --replace &"

# For EnOS
alias rankmirror="sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist; yay -Syyu; sudo eos-rankmirrors --verbose; yay -Syyu"

# for Raspberry Pi
alias sensorspi="sudo /usr/bin/vcgencmd measure_temp"
alias temppi="sudo /usr/bin/vcgencmd measure_temp"

# To pastebin
alias 0x0="curl -F file=@- 0x0.st"

# Custom aliases
alias remoterender="/home/$USER/.configuracoes/Scripts/BlenderRemote"
alias winetricksupdate="/home/$USER/.configuracoes/Scripts/winetricksu"

alias ifconfig="ip -br -c a"
alias ipconfig="ip -br -c a"
alias ipa="ip -br -c a"

# For ArchLinux
alias autoremove="sudo pacman -R \$(pacman -Qdtq); yay -Scc"

# For Pentesting
alias metasploit="sudo msfconsole"
alias msfconsole="sudo msfconsole"
alias singlenmap='sudo nmap -Pn --script vuln --exclude 9100 -p1-9099,9101-65535'

# Generate QR Code!
alias qrcode='qrencode -m 2 -t utf8 <<< "$1"'

# Remove SSH Entry
alias sshw="ssh-keygen -f /home/$USER/.ssh/known_hosts -R"

# Tunnels
alias tunnelssh='curl -sSL https://raw.githubusercontent.com/urbancompasspony/server/refs/heads/main/tunnel_ssh | tee /tmp/tunnels>/dev/null ; bash /tmp/tunnels'

# For audio!
alias v2a="ffmpeg -i"
alias yt-dlpa="yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 -o '%(title)s.%(ext)s'"

sync() {
    echo "Executando sync e monitorando..."
    
    # Executa sync em background
    command sync &
    SYNC_PID=$!
    
    # Loop de monitoramento
    while kill -0 $SYNC_PID 2>/dev/null; do
        clear
        echo "Sync em andamento..."
        echo "$(grep -i dirty /proc/meminfo)"
        sleep 0.5
    done
    
    clear
    echo "Sync concluído!"
    echo "Final $(grep -i dirty /proc/meminfo)"
}

syncs() {
    watch 'echo $(grep -i dirty /proc/meminfo)'
}

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

  [ -z "$password" ] && {
    dialog --title "ERROR" --msgbox "É necessário digitar uma senha para continuar." 6 40; clear
  } || {
    [ "$hash0" = "$hash1" ] && {
      docker ps -a | grep dominio 1> /dev/null && {
      docker exec -it dominio /root/.init
      } || {
        clear; echo "Nenhum Dominio encontrado neste servidor!"; sleep 2
      }
    } || {
      dialog --title "ERROR" --msgbox "Senha incorreta. \nTente novamente!" 6 30
      timeout=$((timeout+1)); sleep $timeout; domain
    }
  }
}

hash1="51da913e7b04c1b70543dc263ecc5106"

#######################################################
# SPECIAL FUNCTIONS
#######################################################

# lz4:
alias tarc="tar -I 'lz4 -1 -c -v -' --totals -cpf"
alias tarx="tar -I 'lz4 -d -c -' -xf"

# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# Searches for text in all files in the current folder
ftext ()
{
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
cpp()
{
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
	| awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# Copy and go to the directory
cpg ()
{
	if [ -d "$2" ];then
		cp $1 $2 && cd $2
	else
		cp $1 $2
	fi
}

# Move and go to the directory
mvg ()
{
	if [ -d "$2" ];then
		mv $1 $2 && cd $2
	else
		mv $1 $2
	fi
}

# Create and go to the directory
mkdirg ()
{
	mkdir -p $1
	cd $1
}
