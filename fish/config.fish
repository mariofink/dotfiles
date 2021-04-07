set LANG 'en_GB.UTF-8'

fenv source ~/.profile
starship init fish | source
set PATH $HOME/.jenv/bin $PATH
status --is-interactive; and source (jenv init -|psub)
