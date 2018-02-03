# dev-setup

### Installation 

#### Mac OSX, Ubuntu Linux x64
```
git clone https://github.com/hoanhan101/dev-setup.git && cd dev-setup && ./setup.sh
```

#### Ubuntu-based Docker container
```
apt-get update
apt-get install git
git clone https://github.com/hoanhan101/dev-setup.git && cd dev-setup && ./docker-setup.sh
```

#### `zsh` on AWS EC2 Ubuntu instance
```
sudo apt-get install zsh
```
Mannually `sudo vim /etc/pam.d/chsh` and comment the `auth required pam_shells.so`.

`sudo chsh $USER -s $(which zsh)` and restart.

Now `zsh` is working and we can install `oh-my-zsh`:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Usage

#### `tmux`
```
./tmux.init [session-name] [working-directory]
```
where default `session-name` is `dev` and default `working-directory` is
current directory.
