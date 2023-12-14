FROM debian:latest

RUN apt-get update
RUN apt-get upgrade -y

# General
RUN apt-get install git man build-essential bsdmainutils curl -y

# c/c++ specific
RUN apt-get install  make cmake g++ valgrind -y

#minishell
RUN apt-get install libreadline-dev -y
RUN apt-get install lsof -y

#editor
RUN apt-get install vim nano -y

#graphic projects
RUN apt-get install libglfw3-dev -y
