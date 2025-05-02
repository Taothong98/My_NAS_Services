FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y openssh-server sudo && \
    mkdir /var/run/sshd

# ARGs for username and password
ARG SSH_USER
ARG SSH_PASS

# Create user and set password
RUN useradd -m -s /bin/bash ${SSH_USER} && \
    echo "${SSH_USER}:${SSH_PASS}" | chpasswd && \
    usermod -aG sudo ${SSH_USER}

# Setup SSH directory
RUN mkdir -p /home/${SSH_USER}/.ssh && \
    chown ${SSH_USER}:${SSH_USER} /home/${SSH_USER}/.ssh && \
    chmod 700 /home/${SSH_USER}/.ssh

RUN chmod -R 777 /home    

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

# sudo chmod -R 777 main_data/