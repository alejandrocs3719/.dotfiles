# source global shell alias & variables files
 
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
# [ -f "$XDG_CONFIG_HOME/shell/vars" ] && source "$XDG_CONFIG_HOME/shell/vars"

# Load matugen colors if they exist
if [[ -f $XDG_CONFIG_HOME/zsh/zsh-colors.zsh ]]; then
  source $XDG_CONFIG_HOME/zsh/zsh-colors.zsh
fi

# Emacs mode by default
bindkey -e # This is needed because the EDITOR env variable string contains "vi"

# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
# autoload -U tetris # main attraction of zsh, obviously

# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# main opts
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
#stty stop undef # disable accidental ctrl s
stty -ixon

# history opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved

# prompt
#NEWLINE=$'\n'
#PROMPT="${NEWLINE}%K{#2E3440}%F{#E5E9F0}$(date +%H:%M) %K{#3b4252}%F{#ECEFF4} %n %K{#4c566a} %~ %f%k ❯ " # nord theme

#echo -e "${NEWLINE}\x1b[38;5;137m\x1b[48;5;0m it's$(print -P '%D{%_I:%M%P}\n') \x1b[38;5;180m\x1b[48;5;0m $(uptime -p | cut -c 4-) \x1b[38;5;223m\x1b[48;5;0m $(uname -r) \033[0m" # current

# prompt
NEWLINE=$'\n'

PROMPT="${NEWLINE}\
%K{$MAT_SURFACE}%F{$MAT_ON_SURFACE}$(date +%H:%M) \
%K{$MAT_PRIMARY}%F{$MAT_ON_PRIMARY} %n \
%K{$MAT_SECONDARY}%F{$MAT_ON_SECONDARY} %~ \
%f%k %F{$MAT_PRIMARY}❯%f "

print -P "${NEWLINE}\
%K{$MAT_SURFACE}\
%F{$MAT_SECONDARY} it's %D{%_I:%M%P} \
%F{$MAT_TERTIARY}$(uptime -p | cut -c 4-) \
%F{$MAT_ON_SURFACE}$(uname -r) \
%f%k"

