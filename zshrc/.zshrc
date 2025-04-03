# Platform-specific imports
case "$(uname)" in
  "Linux")
    source ~/.zshrc.linux
    ;;
  "Darwin")
    source ~/.zshrc.macos
    ;;
  *)
    ;;
esac

# Magic d function
function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}
compdef _dirs d

# zsh common settings
zstyle -e ':autocomplete:*:*' list-lines 'reply=7'

# Common aliases
alias gbg='LANG=C git branch -vv | grep ": gone\]"'
alias gc='git commit --verbose'
alias gd='git diff'
alias glo='git log --oneline --decorate'
alias gst='git status'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls --color'
alias lsa='ls -lah'

# Use bat if available
if type bat &>/dev/null; then
	alias cat="bat"
fi

# Use zoxide if available
if type zoxide &>/dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi

# Disable pyc
export PYTHONDONTWRITEBYTECODE=1

# PATH fixes
export PATH="$PATH:${HOME}/.local/bin:${HOME}/bin"