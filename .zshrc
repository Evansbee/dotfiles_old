# Created by newuser for 4.3.12
autoload -U compinit promptinit
autoload -U colors && colors
compinit
promptinit

zstyle ':completion:*' menu select

PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}%#"
RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]"
