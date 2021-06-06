export ZSH="/home/kali/.oh-my-zsh"
ZSH_THEME="lambda"

plugins=(git tunip htb)

source $ZSH/oh-my-zsh.sh
zstyle ":completion:*:commands" rehash 1
bindkey "^R" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

export X=/usr/share/exploitdb/exploits/
export PATH="$PATH:/home/kali/.local/bin:/home/kali/.gem/ruby/2.7.0/bin"

alias p="proxychains -q"
alias find="noglob find"
