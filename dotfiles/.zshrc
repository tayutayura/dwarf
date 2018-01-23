# LANG
export LANG=ja_JP.UTF-8

# PROMPT
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
