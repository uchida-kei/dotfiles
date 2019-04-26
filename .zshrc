setopt HIST_IGNORE_DUPS
autoload -U promptinit
promptinit
autoload -U colors && colors
DEFAULT=$'\U2744'
PROMPT="
%{${fg[blue]}%}%d%{$reset_color%}
${DEFAULT} "
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "b4b4r07/zsh-gomi", as:command, use:bin/gomi
zplug "b4b4r07/enhancd", use:init.sh
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi


# Then, source plugins and add commands to $PATH
zplug load --verbose

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux -u


clear
