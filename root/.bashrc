PS1="\[\033[1;31m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;121m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;208m\]\W\[$(tput sgr0)\]\\$\[$(tput sgr0)\]"
alias ll='ls -la'
alias gc="gcc -Werror -Wextra -Wall"
alias mm="make debug && valgrind --leak-check=full --track-origins=yes --log-file=valgrind.log ./minishell"
alias c="cd code"
alias q=clear