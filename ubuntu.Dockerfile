FROM ubuntu:latest

ARG USER="user"
ARG PASSWORD="password"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get -y install apt-utils sudo

RUN useradd -m -s /bin/bash -G sudo ${USER} && \
  echo "${USER}:${PASSWORD}" | chpasswd && \
  echo "%sudo ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /home/${USER}/
RUN touch .bashrc
RUN mkdir .config

WORKDIR /home/${USER}/Dotfiles

COPY . .

RUN chown -R ${USER}:${USER} /home/${USER}

USER ${USER}

RUN chmod +x make_link.sh
RUN chmod +x install.sh

RUN ./install.sh --ubuntu

# ENTRYPOINT [ "/bin/bash", "-c", "./make_link.sh && ./install.sh -u && source ~/.nvm/nvm.sh && nvim --headless" ]
ENTRYPOINT ["nvim --headless"]
