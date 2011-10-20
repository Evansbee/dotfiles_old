# Created by newuser for 4.3.12
autoload -U compinit promptinit
autoload -U colors && colors
compinit
promptinit

zstyle ':completion:*' menu select

alias ls='ls --color=always'
alias grep='grep --color'

PROMPT="%{$fg[red]%}%n%{$reset_color%} %{$fg[yellow]%}%1~ % %{$fg[green]%}>%{$fg[blue]%}>%{$reset_color%}>"
#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}%#"

RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]"
