set fish_greeting ""
set -gx TERM xterm-256color

set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1


# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll - A"
alias odoo-cr-folder "~/.config/fish/create-odoo.fish"


set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.poetry/bin $PATH
set -gx PYTHONPATH ~/Projects/odoo/odoo $PYTHONPATH
# NodeJS

set -gx PATH node_modules/.bin $PATH

# GO

set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
# Rust

set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH /usr/local/include $PATH

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end
# C CPP
set -Ux LD_LIBRARY_PATH /usr/local/lib $LD_LIBRARY_PATH
set -Ux LD_LIBRARY_PATH /usr/local/include $LD_LIBRARY_PATH
fish_add_path /usr/local/opt/llvm/bin
set -g -x CXXFLAGS "-isystem /usr/local/include"
set -g -x LDFLAGS "$LDFLAGS -L /usr/local/lib"
set -gx PATH /usr/local/include $PATH
set -gx PATH /usr/local/lib/ $PATH
