FROM ubuntu:latest
MAINTAINER Hoanh An <hoanhan@bennington.edu>

RUN apt-get update && apt-get install -y \
	git \
	curl \
    wget \
	vim \
	tmux \
    zsh \
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

RUN chsh -s /bin/zsh
ENV SHELL /usr/bin/zsh
ENTRYPOINT /bin/zsh
