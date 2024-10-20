# start custom theme
starship init fish | source

# neofetch in start term
neofetch --colors 2 2 2 2 2 2 2 2 --ascii ~/.config/neofetch/skull.txt --package_managers off 

# add function that provides ability to switch En to Ru.
setxkbmap -layout us,ru -variant -option grp:alt_shift_toggle

export EDITOR=nvim

# abbrs
abbr config.fish nvim  ~/.config/fish/config.fish
abbr config.i3 nvim ~/.config/i3/config
abbr config.kitty nvim ~/.config/kitty/kitty.conf
abbr cnfvim nvim ~/.config/nvim/init.vim
abbr Downloads cd ~/Downloads
# alias
alias ls 'grc --colour=auto ls -l'
alias cb 'xclip -selection clipboard'
alias rm 'rm -rf'
alias less 'batcat'
alias bmount 'bash /home/lightning/Programs/bashmount/bashmount'

function config
    cd ~/.config
    ls
end

function rpath
    realpath $argv | cb
end

function c
    cd $argv
    echo ""
    ls
end

# Translate en to ru
function ter
    trans -s en -t ru -brief (string join " " $argv) | cb
end
function tre
    trans -s ru -t en -brief (string join " " $argv) | cb
end

# ADD PATH
set -U fish_user_paths ~/scripts $fish_user_paths

# functions
function fish_greeting
   echo "Hello Master, how are you?"
end

# Modifying folder creation
function mkcd
    mkdir $argv
    cd $argv
end

# Переназначение Caps Lock на ESC
setxkbmap -option caps:escape

