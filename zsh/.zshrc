typeset -U path cdpath fpath manpath
# Use viins keymap as the default.
bindkey -v

export DIRENV_LOG_FORMAT=""
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export VOLTA_HOME="$HOME/.volta"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="underline"
source /home/pmlogist/.gvm/scripts/gvm
source $HOME/.cargo/env
export PATH="$HOME/.cargo/bin:$PATH"

export BINPATH="$HOME/.bin"
export PATH=$BINPATH:$PATH
export PATH=$GOBIN:$PATH
export PATH=$VOLTA_HOME/bin:$PATH
export PATH=$HOME/.cache/npm-packages/bin:$PATH
export NODE_PATH=$HOME/.cache/npm-packages/lib/node_modules
export PATH=$HOME/.cargo/bin:$PATH

path+="$HOME/.config/zsh/plugins/zsh-syntax-highlighting"
fpath+="$HOME/.config/zsh/plugins/zsh-syntax-highlighting"
path+="$HOME/.config/zsh/plugins/zsh-completions"
fpath+="$HOME/.config/zsh/plugins/zsh-completions"
path+="$HOME/.config/zsh/plugins/zsh-history-substring-search"
fpath+="$HOME/.config/zsh/plugins/zsh-history-substring-search"
path+="$HOME/.config/zsh/plugins/zsh-autosuggestions"
fpath+="$HOME/.config/zsh/plugins/zsh-autosuggestions"
path+="$HOME/.config/zsh/completions/docker"
fpath+="$HOME/.config/zsh/completions/docker"
path+="$HOME/.config/zsh/completions/nix-zsh-completions"
fpath+="$HOME/.config/zsh/completions/nix-zsh-completions"
source "/usr/share/fzf/shell/key-bindings.zsh"

# Oh-My-Zsh/Prezto calls compinit during initialization,
# calling it twice causes slight start up slowdown
# as all $fpath entries will be traversed again.
autoload -U compinit && compinit

if [[ -f "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" ]]; then
  source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
fi
if [[ -f "$HOME/.config/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh" ]]; then
  source "$HOME/.config/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh"
fi
if [[ -f "$HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" ]]; then
  source "$HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
fi
if [[ -f "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

HISTSIZE="50000"
SAVEHIST="50000"

HISTFILE="/home/pmlogist/.local/share/zsh/zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt AUTO_CD              # Go to folder path without using cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
#setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY
setopt autocd

#  bindkey "$terminfo[kcuu1]" history-substring-search-up
#  bindkey "$terminfo[kcud1]" history-substring-search-down
#  bindkey -M vicmd 'k' history-substring-search-up
#  bindkey -M vicmd 'j' history-substring-search-down

if [[ $TERM != "dumb" && (-z $INSIDE_EMACS || $INSIDE_EMACS == "vterm") ]]; then
  eval "$(starship init zsh)"
fi


# Aliases
alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias ll='ls -la'
alias vi='nvim'
alias vim='nvim'

# Global Aliases


# Named Directory Hashes
hash -d dls="$HOME/Downloads"
hash -d docs="$HOME/Docs"
hash -d enclosure="$HOME/Workspace/enclosure"
hash -d kozea="$HOME/Workspace/kozea"
hash -d music="$HOME/Music"
hash -d projects="$HOME/Workspace/pmlogist"

eval "$(direnv hook zsh)"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
