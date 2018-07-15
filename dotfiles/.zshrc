# LANG
export LANG=ja_JP.UTF-8

# PROMPT
# if sindresorhus/pure is not installed, reflect this setting.
PROMPT='%m %~ %% '

# autocomplete
autoload -U compinit
compinit

# save histories
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt auto_cd              # cd の入力を不必要にする
function chpwd() { ls }     # 自動ls
setopt list_packed          # 補完候補を詰める
setopt auto_pushd           # 移動したディレクトリを記憶 cd -[tab]
unsetopt correctall         # disable correct
setopt nolistbeep           # ビープ音を消す

# aliases
alias vi='nvim'

# Find where asdf should be installed.
ASDF_DIR="${ASDF_DIR:-$HOME/.asdf}"

# Load asdf, if found.
if [ -f $ASDF_DIR/asdf.sh ]; then
    . $ASDF_DIR/asdf.sh
fi

export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"

# PATH for cargo
export PATH="$HOME/.cargo/bin:$PATH"

# PATH for node_modules in current directory
export PATH=$PATH:node_modules/.bin

# PATH for rebar3
export PATH=$HOME/.cache/rebar3/bin:$PATH

export USE_LLDB=1

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"

zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
