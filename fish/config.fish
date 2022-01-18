set fish_greeting ""
set -gx TERM xterm-256color

set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1


# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll - A"


set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS

set -gx PATH node_modules/.bin $PATH

# GO

set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end
