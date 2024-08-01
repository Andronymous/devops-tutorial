# installed version: 5.10.0-1ppa~focal
FROM ubuntu:20.04

ENV REPO_OS_OVERRIDE "linux"

RUN apt-get  update && \
    apt-get  upgrade -y --no-install-recommends && \
    apt-get  install -y --no-install-recommends apt-utils && \
    apt-get  install -y --no-install-recommends software-properties-common && \
    add-apt-repository --yes --update ppa:ansible/ansible

RUN apt-get update && \
    apt-get upgrade -y --no-install-recommends && \
    apt-get install -y --no-install-recommends ansible && \
    apt-get install -y --no-install-recommends openssh-server && \
    apt-get install -y --no-install-recommends python3 && \
    apt-get install -y --no-install-recommends iputils-ping && \
    apt-get install -y --no-install-recommends curl && \
    apt-get install -y --no-install-recommends git && \
    apt-get install -y --no-install-recommends wget && \
    apt-get install -y --no-install-recommends vim

RUN ansible --version

RUN apt-get update && \
    apt-get autoremove -y

COPY home/.ssh/ansible_rsa /root/.ssh/ansible_rsa
COPY home/.ssh/ansible_rsa.pub /root/.ssh/ansible_rsa.pub
COPY home/.ssh/authorized_keys /root/.ssh/authorized_keys

COPY home/entrypoint.sh /root/entrypoint.sh
COPY home/.gitconfig /root/.gitconfig

RUN chmod +x /root/entrypoint.sh

RUN mkdir /ansible
WORKDIR /ansible

ENTRYPOINT ["/root/entrypoint.sh"]