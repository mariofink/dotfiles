set LANG 'en_GB.UTF-8'
set PATH $PATH

fenv source ~/.profile
starship init fish | source
status --is-interactive; and source (jenv init -|psub)
