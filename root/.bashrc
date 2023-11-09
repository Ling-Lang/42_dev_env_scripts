PS1='\[\e[92m\]➜ 42_dev_env@\[\e[0;1m\]\W \[\e[92;2m\]$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2) \[\e[0m\]'
export CODE="/code"
alias ll='ls -la'
alias gc="gcc -Werror -Wextra -Wall"
alias mm="make debug && valgrind --leak-check=full --track-origins=yes --log-file=valgrind.log ./minishell"
alias val="valgrind --leak-check=full --track-origins=yes --log-file=valgrid.log"
alias sc="source $HOME/.bashrc"
alias c="cd $CODE"
alias q=clear
\[\033[1;31m\]\u\[\]@\[\]\[\033[38;5;121m\]\h\[\]:\[\]\[\033[38;5;208m\]\W\[\]\$\[\]