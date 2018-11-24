# dev-setup

This repo contains my development setup, including different configurations for vim, tmux, zsh 
and iTerm2. It works best on Mac OS because Macbook is my main machine. However, I also do include 
the scripts that support Linux and Docker so I can have other options.

## Table of Contents

- [Installation](#installation)
  - [Mac OS, Ubuntu Linux x64](#mac-os-ubuntu-linux-x64)
  - [Docker](#docker)
- [Configuration](#configuration)
  - [Github](#github)
  - [zsh](#zsh)
  - [iTerm2](#iterm2)
  - [Ubuntu](#ubuntu)
  - [MacOS](#macos)
- [Usage](#usage)
  - [tmux](#tmux)
  - [Distraction-free writing environment](#distraction-free-writing-environment)

## Installation 

### Mac OS, Ubuntu Linux x64

> Mac OS requires Xcode to install some tools.

```
git clone https://github.com/hoanhan101/dev-setup.git && cd dev-setup && ./setup.sh
```

**MacVim**

Instead of ovewriting system Vim, a better way is to alias the binary that
comes with MacVim.
- Download and the latest version of [Macvim](https://github.com/macvim-dev/macvim/releases)
- Put this in `.zshrc`: `alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'`.

**YouCompleteMe**

If there is anything wrong with YouComplete, read the [documentaion
](https://github.com/Valloric/YouCompleteMe#mac-os-x) carefully
one more time.: https://github.com/Valloric/YouCompleteMe#mac-os-x

### Docker

Either one of these 3 options below:

**Quick run**

```
docker run -ti hoanhan/dev-setup
```

**Build and run**

```
docker build -t dev-setup . && docker run -ti dev-setup
```

**Install script from a Docker container**

```
git clone https://github.com/hoanhan101/dev-setup.git && cd dev-setup && ./docker-setup.sh
```

## Configuration

### Github

**Sign commits using GPG**

Generate the key:
```
gpg --full-generate-key
```

Copy the key ID:
```
gpg --list-secret-keys --keyid-format LONG
```

Substitute with:
```
gpg --armor --export <KEY_ID>
```

Copy from stdout and add to Github account.

Set the signing key in Git:
```
git config --global user.signingkey <KEY_ID>
git config --global commit.gpgSign true
```

Add it to the bash profile:
```
echo 'export GPG_TTY=$(tty)' >> ~/.bash_profile
```

If it is saying failing to write, do this again:
```
export GPG_TTY=$(tty)
```

### zsh

**Mac OS**

Install and make zsh default shell. Need to restart after this in order for the changes to take place.

```
brew install zsh && chsh -s $(which zsh)
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

**Font**

Need to setup [Powerline fonts](https://github.com/powerline/fonts) to prevent Unicode error.
The script is already included in the setup. Only need to update font in iTerm2:

```
Preferences > Profiles > Text > Change Font > 12pt Inconsolata-dz for Powerline
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

### Ubuntu

**Copy and paste in tmux**

Make sure to install `xclip` in put this one for vim yanking mode in tmux config
file:

```
bind -t vi-copy y copy-pipe "xclip -sel clip -i"
```

### MacOS

**Speed up vim cursor**

Set the Preferences/Keyboard settings at max for these two options:
- Key Repeat
- Deplay Until Repeat

## Usage

### tmux

**Pre-config tmux with splitted plane**

```
./tmux.init [session-name] [working-directory]
```
where default `session-name` is `dev` and default `working-directory` is current directory.

### Distraction-free writing environment

In vim:
- `:Goyo` to enter a distraction-free mode.
- `:SoftPencil` to enable soft-wrap.
