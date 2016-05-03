set TERM xterm-256color

set -x EDITOR vim

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

set -x GOPATH $HOME/.go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

function cd
  builtin cd $argv
  ls -la
end

set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman

fish_vi_mode

source $fisher_home/config.fish
