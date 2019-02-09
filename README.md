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
  - [Oh My Zsh](#oh-my-zsh)
  - [iTerm2](#iterm2)
  - [Ubuntu](#ubuntu)
  - [MacOS](#macos)
  - [Golang](#golang)
  - [vim-go](#vim-go)
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

If `brew install vim` doesn't work, might want to try Macvim.
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
> [Github reference](https://help.github.com/articles/generating-a-new-gpg-key/)

Copy from stdout and add to Github account.

Set the signing key in Git:
```
git config --global user.signingkey <KEY_ID>
git config --global commit.gpgSign true
```

Add it to the bash profile:
```
echo 'export GPG_TTY=$(tty)' >> ~/.profile
```

If it is saying failing to write, do this again:
```
export GPG_TTY=$(tty)
```

If this is failing to write every time we start a session, try
[this](https://stackoverflow.com/questions/39494631/gpg-failed-to-sign-the-data-fatal-failed-to-write-commit-object-git-2-10-0).

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

### Oh My Zsh

**Enable syntax hightlight**

Link:
[github](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)

**Enable fish-like autosuggestion**

Link:
[github](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)

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

**Slow `<SHIFT> + O` in vim**

The problem is, on some terminals,`<SHIFT> + O` is a prefix for several
keycodes. To fix it, need to set the timeout as follows:
```
:set timeout timeoutlen=5000 ttimeoutlen=100
```

> Reference:
> [https://github.com/vim/vim/issues/24](https://github.com/vim/vim/issues/24)

**`ls` color**

In case `ls` doesn't have colored output, which might be the result of a
conflict between zsh theme and `LSCOLORS`. A simple way to fix:

```
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1
```
([source](https://github.com/robbyrussell/oh-my-zsh/issues/5349))

### Golang

**Set `GOPATH`**

> Reference:
> [hoanhan101/go-playground](https://github.com/hoanhan101/go-playground),
> [hoanhan101/ultimate-go](https://github.com/hoanhan101/ultimate-go)

After downloading the binary release fro your system, need to setup the GOPATH
correctly. A simple and straightforward setup is to, first `mkdir $HOME/go`,
then in `.zshrc`:
```
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
```

**Set alias for quick navigation**

In `.zshrc`, set something like this:
```
alias tohoanhan101="cd /Users/hoanhan/go/src/github.com/hoanhan101"
```

**Setup autocompletion to use with vim**

Need to get the [nsf/gocode](https://github.com/nsf/gocode) package first
before adding the plugin to vim and update with Vundle. 

### vim-go

**`:GoDef`**

If `:GoDef` (or `gd` for short)  is not working properly, might want to check
if `go/bin` is added to your `PATH`. Normally it would be configured to
something like this.
```
export PATH=$PATH:$HOME/go/bin
```

Then `:GoUpdateBinaries` to update.

> Reference:
> [using `:GoDef` failed](https://github.com/fatih/vim-go/issues/1807)

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
