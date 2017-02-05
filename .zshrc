ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

plugins=(git)

DISABLE_UPDATE_PROMPT=true
source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/home/dnoel/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

alias gd="git diff"
alias gst="git status"
alias gdh="git diff"
alias hide-spotify="xdotool search --class spotify windowunmap"
alias show-spotify="xdotool search --class spotify windowmap"
alias phpcs="phpcs --colors"
alias hd='hexdump -C'
alias find='noglob find'
alias scp='noglob scp'
alias rsync='noglob rsync'
alias tmux='tmux -u'

x() {
    xxd -ps $1 | tr -d '\n'
}

gen() {
	echo `tr -cd '[:alnum:]' < /dev/urandom | head -c$1`
}

hide-evolution() {
    xdotool search --onlyvisible -classname evolution > /tmp/evo.pid
    xdotool windowunmap $(cat /tmp/evo.pid)
}

show-evolution() {
    xdotool windowmap $(cat /tmp/evo.pid)
}

powersave() {
    sudo id >/dev/null 2>&1
    echo -n "Adjusting..."
    echo -n "."
    sudo powertop --auto-tune >/dev/null 2>&1
    echo -n "."
    sudo systemctl stop dropbox@dnoel.service
    echo -n "."
    sudo systemctl stop sshd.service
    echo "."
}

zstyle ":completion:*:commands" rehash 1

export FBFONT=/usr/share/kbd/consolefonts/ter-216n.psf.gz
export CURL_FORMAT="
time_namelookup:  %{time_namelookup}
time_connect:  %{time_connect}
time_appconnect:  %{time_appconnect}
time_pretransfer:  %{time_pretransfer}
time_redirect:  %{time_redirect}
time_starttransfer:  %{time_starttransfer}
----------
time_total:  %{time_total}"
export VISUAL="vim"
