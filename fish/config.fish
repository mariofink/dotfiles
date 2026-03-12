set LANG 'en_GB.UTF-8'
set PATH $PATH

fenv source ~/.profile

# You must call it on initialization or listening to directory switching won't work
load_nvm > /dev/stderr

starship init fish | source

status --is-interactive; and source (jenv init -|psub)
