PS1='\[\e[92m\]➜ \[\e[0;1m\]\W\[\e[38;5;199;2m\]$([[ -n $(git rev-parse --abbrev-ref HEAD 2>/dev/null) ]] && echo " ($(git rev-parse --abbrev-ref HEAD)$(git diff --quiet || echo " ✗"))") \[\e[0;1;38;5;196m\]>> \[\e[0m\]'
export CODE="/code"
alias help="cat $HOME/.help"
alias ll='ls -la'
alias gc="gcc -Werror -Wextra -Wall"
alias val="valgrind --leak-check=full --track-origins=yes --log-file=valgrid.log"
alias sc="source $HOME/.bashrc"
alias c="cd $CODE"
alias q=clear
alias gst="git status"
alias ga="git add"
alias gcmsg="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gf="git fetch && git merge origin/main"
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
neofetch