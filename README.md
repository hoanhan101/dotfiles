# dev-setup

This repo contains my development setup, including different configurations for vim, tmux, zsh 
and iTerm2. It works best on Mac OS because Macbook is my main machine. However, I also do include 
the scripts that support Linux and Docker so I can have other options.

## Status

### Tasks

- [x] Build a Docker image that contains the development setup
- [x] Make zsh default shell and load configurations
- [x] Install Go
- [x] Test on Mac
- [x] Test on Docker
- [x] Test on Ubuntu
- [x] Configure automated builds on Docker Hub
- [x] Export iTerm2 settings

### Ideas

- [ ] Add Docker persistent volume (not really necessary at the moment)

### Issues

- [x] Fix localization
- [x] Fix Powerline font error
- [ ] vim config in tmux is not up-to-date (buffer error)
- [ ] time is out of sync in Docker container 

## Table of Contents

- [Installation](#installation)
  - [Mac OS, Ubuntu Linux x64](#mac-os-ubuntu-linux-x64)
  - [Docker](#docker)
- [Configuration](#configuration)
  - [zsh](#zsh)
  - [iTerm2](#iterm2)
- [Usage](#usage)
  - [tmux](#tmux)

## Installation 

### Mac OS, Ubuntu Linux x64

```
git clone https://github.com/hoanhan101/dev-setup.git
cd dev-setup && ./setup.sh
```

> Mac OS requires Xcode to install some tools.

### Docker

Either one of these 3 options below:

**Quick run**

```
docker run -ti hoanhan/dev-setup
```

**Build and run**

```
docker build -t dev-setup .
docker run -ti dev-setup
```

**Install script from a Docker container**

```
git clone https://github.com/hoanhan101/dev-setup.git
cd dev-setup && ./docker-setup.sh
```

## Configuration

### zsh

**Mac OS**

Install and make zsh default shell. Need to restart after this in order for the changes to take place.

```
brew install zsh
chsh -s $(which zsh)
```

If these command doesn't work then can change the path directly in Terminal settings to `/usr/local/bin/zsh`.

**Ubuntu**

If running the script doesn't install zsh completely, might want to try:

```
sudo apt-get install zsh
```

Mannually `sudo vim /etc/pam.d/chsh` and comment the `auth required pam_shells.so`.

`sudo chsh $USER -s $(which zsh)` and restart.

Now `zsh` is working and we can install `oh-my-zsh`:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### iTerm2

**Quick setup**

Can load the exported iTerm2 settings by:
```
Preferences > General > Load preferences from a custom folder or URL > com.googlecode.iterm2.plist
```

Below are manual configurations if importing doesn't work.

**Font**

Need to setup [Powerline fonts](https://github.com/powerline/fonts) to prevent Unicode error.
The script is already included in the setup. Only need to update font in iTerm2:

```
Preferences > Profiles > Text > Change Font > <Font name>
```

**tmux**

In order to switch between planes in tmux, need to remap Alt/Option key to Esc+.

```
Preferences > Profiles > Keys > Left Key > Esc+
```

**Shortcuts**

```
Preferences > Profiles > Keys > +
```

Going forward one word:

```
Keyboard shortcut: Option+f
Action           : Send Escape Sequence
Esc+             : f
```

Going backward one word:

```
Keyboard shortcut: Option+b
Action           : Send Escape Sequence
Esc+             : b
```

Delete backward one word:

```
Keyboard shortcut: Option+Delete
Action           : Send Hex Code 
Value            : 0x1B 0x08
```

## Usage

### tmux

**Pre-config tmux with splitted plane**

```
./tmux.init [session-name] [working-directory]
```
where default `session-name` is `dev` and default `working-directory` is current directory.
