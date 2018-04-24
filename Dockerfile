FROM ubuntu:latest
MAINTAINER Hoanh An <hoanhan@bennington.edu>

RUN apt-get update && apt-get install -y \
	git \
	curl \
    wget \
	vim \
	tmux \
    shadow \
    zsh \
    && chsh -s /bin/zsh \
	build-essential cmake \
	python-dev \
	python3-dev \
	python-setuptools \
	python-pip \
	--no-install-recommends && \
	rm -rf /var/lib/apt/lists/* && \
	apt-get clean

COPY * ./
RUN ./start.sh

ENV SHELL /usr/bin/zsh
WORKDIR /root
ENTRYPOINT /bin/zsh
