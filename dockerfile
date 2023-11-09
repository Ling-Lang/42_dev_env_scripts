FROM debian:latest

RUN apt-get update
RUN apt-get upgrade -y

# General
RUN apt-get install g++ valgrind build-essential bsdmainutils -y
RUN apt-get install git make cmake -y
#minishell
RUN apt-get install libreadline-dev -y
RUN apt-get install lsof -y
󱞩
#editor
RUN apt-get install neovim -y

#graphic projects
RUN apt-get install libglfw3-dev -y
