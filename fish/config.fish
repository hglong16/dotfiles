# Commands to run in interactive sessions can go here
set fish_greeting
if status is-interactive

    # Commands to run in interactive sessions can go here
end

set -gx TERM xterm-256color

# theme
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "exa -A"
alias ll "exa -l"
alias lla "ll -A"
alias dcc docker-compose

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargon/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# Odoo

set -gx PYTHONPATH $HOME/Project/odoo $PYTHONPATH



# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

set --universal nvm_default_version 14




function gitlog
    command git log --pretty=format:'%an %d %n %Cgreen%ci%Creset %s%Creset' --after="$argv 00:00" --branches --all >>~/Desktop/gitlog.txt
end
