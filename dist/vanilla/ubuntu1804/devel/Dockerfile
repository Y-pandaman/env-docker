ARG IMAGE_NAME
FROM ${IMAGE_NAME}:vanilla-runtime-ubuntu18.04

LABEL maintainer="Pantao Yao <pantaoyao@gmail.com>"

ENV http_proxy http://192.168.20.195:7890
ENV https_proxy http://192.168.20.195:7890

# Setup SSH
COPY deps/setup_ssh.sh /tmp/
RUN /tmp/setup_ssh.sh \
    && rm -rf /tmp/setup_ssh.sh
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 2222

# Setup dev tools
COPY deps/setup_dev_tools.sh /tmp/
RUN /tmp/setup_dev_tools.sh \
    && rm -rf /tmp/setup_dev_tools.sh

# Setup dotfiles
COPY conf/.zshrc /root/
COPY conf/.tmux.conf /root/

ENV http_proxy ''
ENV https_proxy ''

ENTRYPOINT service ssh restart && zsh