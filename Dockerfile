FROM ubuntu:16.04

RUN echo "root:rootpassword" | chpasswd

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    software-properties-common=0.96.20.9 \
    build-essential=12.1ubuntu2 \
    sudo=1.8.16-0ubuntu1.7 \
 && apt-add-repository --yes --update ppa:ansible/ansible \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    ansible=2.8.5-1ppa~xenial \
 && rm -rf /var/lib/apt/lists/*

RUN ansible --version

COPY . /app

WORKDIR /app

RUN useradd -m pedro -u 1000 -p pedropassword

USER pedro

CMD [ "ansible-playbook", "-i", "hosts", "playbook.yaml", "--extra-vars", "ansible_become_pass=rootpassword" ]
