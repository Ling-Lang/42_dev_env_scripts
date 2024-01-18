FROM archlinux:latest
RUN pacman -Sy
RUN pacman -S git neofetch --noconfirm
RUN pacman -S clang  make cmake valgrind --noconfirm
RUN pacman -S  lsof --noconfirm
RUN pacman -S  vim nano --noconfirm