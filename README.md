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

### `tmux`
```
./tmux.init [session-name] [working-directory]
```
where default `session-name` is `dev` and default `working-directory` is
current directory.
