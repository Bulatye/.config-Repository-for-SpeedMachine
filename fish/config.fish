starship init fish | source

setxkbmap -layout us,ru -variant -option grp:alt_shift_toggle

# abbrs
# Сonfiguration files
abbr config.fish vim  ~/.config/fish/config.fish
abbr config.i3 vim ~/.config/i3/config
abbr config.kitty vim ~/.config/kitty/kitty.conf
# functions
function fish_greeting
    set quote (curl -s https://api.quotable.io/random | jq -r '.content')  
    # Вывод цитаты с cowsay
    cowsay -f eyes $quote | lolcat
end
