# dev-setup

This repo contains my development setup, including different configurations for vim, tmux, zsh 
and iTerm2. It works best on Mac OS because Macbook is my main machine. However, I also do include 
the scripts that support Linux and Docker so I can have other options.

## Status

### Completed

- [x] Build a Docker image that contains the development setup
- [x] Make zsh default shell and load configurations
- [x] Install Go
- [x] Use Unicode
- [x] Fix Powerline font error
- [x] Test on Docker
- [x] Test on Ubuntu

### Ideas

- [ ] vim config in tmux is not up-to-date (buffer error)
- [ ] time is out of sync in Docker container 

## Table of Contents

- [Installation](#installation)
- [zsh](#zsh)
- [iTerm2](#iterm2)
- [Usage](#usage)

## Installation 

### Mac OS, Ubuntu Linux x64

```
git clone https://github.com/hoanhan101/dev-setup.git
cd dev-setup && ./setup.sh
```

> Mac OS requires Xcode to install some tools.

### Docker

**Quick run**

```
docker run -ti hoanhan/dev
```

**Build and run**

```
docker build -t dev .
docker run -ti dev
```

**Install script from a Docker container**

```
git clone https://github.com/hoanhan101/dev-setup.git
cd dev-setup && ./docker-setup.sh
```

## zsh

### Mac OS

Install and make zsh default shell. Need to restart after this in order for the changes to take place.

```
brew install zsh
chsh -s $(which zsh)
```

If these command doesn't work then can change the path directly in Terminal settings to `/usr/local/bin/zsh`.

### Ubuntu

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

## iTerm2

### Font

Need to setup [Powerline fonts](https://github.com/powerline/fonts) to prevent Unicode error.
The script is already included in the setup. Only need to update font in iTerm2:

```
Preferences > Profiles > Text > Change Font > <Font name>
```

### tmux

In order to switch between planes in tmux, need to remap Alt/Option key to Esc+.

```
Preferences > Profiles > Keys > Left Key > Esc+
```

### Shortcuts

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
