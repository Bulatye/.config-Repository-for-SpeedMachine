# start custom theme
# starship init fish | source
# add function that provides ability to switch En to Ru.
setxkbmap -layout us,ru -variant -option grp:alt_shift_toggle
# abbrs
abbr config.fish nvim  ~/.config/fish/config.fish
abbr config.i3 nvim ~/.config/i3/config
abbr config.kitty nvim ~/.config/kitty/kitty.conf
abbr config cd ~/.config
abbr cnfvim nvim ~/.config/nvim/init.vim
abbr Downloads cd ~/Downloads
# alias
alias ls 'ls -1 --color=auto'
alias cb 'xclip -selection clipboard'
alias rm 'rm -rfi'
# Translate en to ru
function ter
    trans -s en -t ru -brief $argv | cb
end
function tre
    trans -s ru -t en -brief $argv | cb
end
#
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

set -l normal #1d2b1d
