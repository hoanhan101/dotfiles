# dev-setup

This repo contains my development setup, including different configurations for vim, tmux, zsh 
and iTerm2. It works best on Mac OS because Macbook is my main machine. However, I also do include 
the scripts that support Linux and Docker container based machine so I can have other options too.

## Installation 

### Mac OS, Ubuntu Linux x64

**Mac OS note:** Requires Xcode to fully install all the dependencies.

```
git clone https://github.com/hoanhan101/dev-setup.git
cd dev-setup && ./setup.sh
```

### Docker

```
docker build -t dev-setup .
docker run -ti dev-setup /bin/bash 
```

### zsh

#### Mac OS

Install and make zsh default shell. Need to restart after this in order for the changes to take place.

```
brew install zsh
chsh -s $(which zsh)
```

If these command doesn't work then can change the path directly in Terminal settings to `/usr/local/bin/zsh`.

#### Ubuntu

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

## Usage

### tmux

**Pre-config tmux with splitted plane**

```
./tmux.init [session-name] [working-directory]
```
where default `session-name` is `dev` and default `working-directory` is current directory.

**Configurations**

In order to switch between planes, need to remap Alt/Option key to Esc+ in Iterm2.

```
Preferences > Profiles > Keys > Left Key > Esc+
```
