FROM debian:latest

RUN apt-get update
RUN apt-get upgrade -y

# General
RUN apt-get install git man build-essential bsdmainutils curl -y

# c/c++ specific
RUN apt-get install  make cmake g++ valgrind -y

#rust and other misc for customization
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
RUN . ~/.bashrc \
    && cargo install --git https://github.com/MordechaiHadad/bob.git \
    && bob install latest \
    && bob use latest
#minishell
RUN apt-get install libreadline-dev -y
RUN apt-get install lsof -y

#editor
RUN apt-get install neovim -y

#graphic projects
RUN apt-get install libglfw3-dev -y
