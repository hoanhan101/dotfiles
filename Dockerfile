FROM ubuntu:latest
MAINTAINER Hoanh An <hoanhan@bennington.edu>

# Set locale
ENV LANG=C.UTF-8 
ENV LC_ALL=C.UTF-8

# Install dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    mercurial \
    git \
    curl \
    wget \
    vim \
    fonts-powerline \
    xsel \
    xclip \
    tmux \
    zsh \
    build-essential cmake \
    python-dev \
    python3-dev \
    python-setuptools \
    python3-setuptools \
    python-pip \
    python3-pip \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Install configurations
COPY * ./
RUN ./start.sh

# Install Go (v1.10.1)
RUN curl -s https://storage.googleapis.com/golang/go1.10.1.linux-amd64.tar.gz | tar -v -C /usr/local -xz
ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:/go/bin:/usr/local/bin:$PATH

# Make zsh default shell
RUN chsh -s /bin/zsh
ENV SHELL /usr/bin/zsh
ENTRYPOINT /bin/zsh
