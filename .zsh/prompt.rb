COLORS = ['%{$fg[blue]%}',
          '%{$fg[yellow]%}',
          '%{$fg[magenta]%}',
          '%{$fg[white]%}',
          '%{$fg[green]%}',
          '%{$fg[red]%}',
          '%{$fg[cyan]%}']

RESET = '%{$reset_color%}'

def colorize text
  text = ""+text+""
  COLORS[text[0].ord%COLORS.length] + text + RESET
end

def get_pwd_array
  pwd_array = Dir.pwd.split('/').map{ |x| x if x != ""}.compact
  
  if pwd_array.empty?
    pwd_array = ['/']
  else
    pwd_array = pwd_array.flat_map { |x| ['/',x]}
  end

  pwd_array
end

def get_short_pwd_array
  pwd_array = get_pwd_array
  pwd_array.to_enum.with_index do |val,idx|
    pwd_array[idx] = pwd_array[idx][0] unless idx == pwd_array.length-1
  end
  
  pwd_array
end

def colorize_pwd_array pwd_array
  pwd_array.map! do |x|
    if x != '/'
      x = colorize x
    end      
    x
  end

  pwd_array
end

pwd_array = get_short_pwd_array
pwd_array = colorize_pwd_array pwd_array

print pwd_array.join
