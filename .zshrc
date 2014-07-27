# Created by newuser for 4.3.12

autoload -U compinit promptinit
autoload -U colors && colors

setopt prompt_subst

compinit
promptinit

zstyle ':completion:*' menu select

alias source='source ~/.zshrc'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

function chpwd {
  local RG="%(?,%{$fg[green]%},%{$fg[red]%})"
  local KL="%{$reset_color%}"
  PROMPT=" ${RG}❰${KL} $(ruby ~/.zsh/prompt.rb) ${RG}❱${KL} "
}
chpwd


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
