#hi-hello.private-ncr.fin-ntruss.com/k8s/dev/devops/dev-tools:0.0.7
FROM ubuntu:20.04
LABEL authors="devops"

ARG UID=1001
ARG GID=1001
ARG UNAME=devops
ARG DEBIAN_FRONTEND=noninteractive

ENV UID ${UID}
ENV GID ${GID}
ENV UNAME ${UNAME}

ENV TF_VERSION 1.5.6
ENV ANSIBLE_VERSION 2.15.3
ENV PK_VERSION 1.9.4
ENV NCP_CLI_VERSION 1.1.16_20230822
ENV AWS_CLI_VERSION 1.15.85

# devops access info
ENV ACCESS_KEY_ID B8706A69B7**********
ENV SECRET_ACCESS_KEY 7C48BD41C67993AD8B693A6B335EFB**********

RUN useradd --uid ${UID} --create-home --shell /bin/bash -G sudo,root ${UNAME}
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# built-in
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl \
    wget \
    iputils-ping \
    sshpass \
    python3 \
    python3-pip \
    tree \
    original-awk \
    jq \
    net-tools \
    nmap \
    git \
    git-core \
    unzip \
    bash \
    bash-completion \
    vim \
    zsh \
    locales \
    fonts-powerline \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common \
    && apt-get clean all

# Add Docker’s official GPG key and repository:
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install Docker
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

RUN mkdir -p /home/${UNAME}/base

# terraform install
WORKDIR /home/${UNAME}/base
RUN wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
RUN unzip -o terraform_${TF_VERSION}_linux_amd64.zip
RUN mv terraform /usr/local/bin/
RUN terraform --version

# ansible install
RUN python3 -m pip install ansible
RUN ansible --version
COPY ansible.cfg /root/.ansible
RUN export ANSIBLE_HOST_KEY_CHECKING=False

# packer install
RUN wget https://releases.hashicorp.com/packer/${PK_VERSION}/packer_${PK_VERSION}_linux_amd64.zip
RUN unzip -o packer_${PK_VERSION}_linux_amd64.zip
RUN mv packer /usr/local/bin/
RUN packer --version

# ncp cli intsall
RUN wget https://www.fin-ncloud.com/api/support/download/files/cli/FIN_CLI_${NCP_CLI_VERSION}.zip
RUN unzip -o FIN_CLI_${NCP_CLI_VERSION}.zip
RUN mkdir -p /home/${UNAME}/ncp
RUN cp -r FIN_CLI_${NCP_CLI_VERSION}/cli_linux/* /home/${UNAME}/ncp/
#COPY FIN_CLI_${NCP_CLI_VERSION}/cli_linux /home/${UNAME}/

#RUN echo "[DEFAULT]\n" \
#    "ncloud_access_key_id = "${ACCESS_KEY_ID}\n \
#    "ncloud_secret_access_key = "${SECRET_ACCESS_KEY}\n \
#    "ncloud_api_url = https://fin-ncloud.apigw.fin-ntruss.com\n" \ > ./configure
#COPY /home/$UNAME/base/FIN_CLI_${NCP_CLI_VERSION}/configure /home/$UNAME/.ncloud

# todo: cli->api
#RUN mkdir -p /home/${UNAME}/.ncloud
#COPY ./configure /home/${UNAME}/.ncloud
#WORKDIR /home/${UNAME}/ncp
#RUN ./ncloud vserver getZoneList --regionCode FKR

# aws object storage cli install
RUN mkdir -p /home/${UNAME}/.aws
RUN pip install awscli==${AWS_CLI_VERSION}
RUN aws configure set aws_access_key_id ${ACCESS_KEY_ID} --profile default \
    && aws configure set aws_secret_access_key ${SECRET_ACCESS_KEY} \
    && aws configure set region kr-standard \
    && aws configure set output json
RUN aws --endpoint-url=https://kr.object.fin-ncloudstorage.com s3api list-buckets


# Install zsh & plugins
RUN chsh -s $(which zsh)
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k

RUN echo 'source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
RUN echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >>~/.zshrc
RUN echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >>~/.zshrc


WORKDIR /home/${UNAME}

CMD ["zsh"]