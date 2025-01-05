FROM archlinux:base-devel

ARG USER="user"
ARG PASSWORD="password"

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm sudo

RUN yes | pacman -Sc

RUN useradd -m -G wheel -s /bin/bash ${USER} && \
  echo "${USER}:${PASSWORD}" | chpasswd && \
  echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /home/${USER}/
RUN touch .bashrc
RUN mkdir .config

WORKDIR /home/${USER}/Dotfiles

COPY . .

RUN chown -R ${USER}:${USER} /home/${USER}

USER ${USER}

RUN chmod +x make_link.sh
RUN chmod +x install.sh

RUN ./install.sh --arch

# ENTRYPOINT [ "/bin/bash", "-c", "./make_link.sh && ./install.sh -a && source /usr/share/nvm/init-nvm.sh && nvim --headless" ]
ENTRYPOINT ["nvim --headless"]
