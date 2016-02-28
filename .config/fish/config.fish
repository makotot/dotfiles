# Path to Oh My Fish install.
#set -gx OMF_PATH /Users/makototateno/.local/share/omf

set TERM xterm-256color

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/makototateno/.config/omf

# rbenv
set PATH "$HOME/.rbenv/shims" $PATH
rbenv rehash ^/dev/null
function rbenv
    set -l command $argv[1]
    if test (count $argv) -gt 1
        set argv $argv[2..-1]
    end

    switch "$command"
        case rehash shell
            eval (rbenv "sh-$command" $argv)
        case '*'
            command rbenv "$command" $argv
    end
end

# Load oh-my-fish configuration.
#source $OMF_PATH/init.fish
#set fisher_home ~/.local/share/fisherman
#set fisher_config ~/.config/fisherman
#source $fisher_home/config.fish
set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish
