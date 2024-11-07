# Basic tools

## git

```Shell
sudo apt install git -y
git config --global user.name "Demian Martinez"
git config --global user.email "demian.martinez@oracle.com"
```

## exa

Preferred option (if available):

```sh
sudo apt install exa
```

Otherwise, install manually as explained below.

Download binaries from [exa website](https://the.exa.website) and extract to temp folder. Alternatively, run the command below:

```sh
# Download and unzip
cd ~/Downloads
wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip
unzip -d exa exa-linux-x86_64-v0.10.0.zip
```

Copy the binaries to their respective destionations:

```sh
# Copy binary
sudo cp exa/bin/exa /usr/local/bin/
# Copy completions
sudo cp exa/completions/exa.bash /etc/bash_completion.d/
# Copy man pages
sudo mkdir -p /usr/local/share/man/man1
sudo cp exa/man/exa.1 /usr/local/share/man/man1/
sudo mkdir -p /usr/local/share/man/man5
sudo cp exa/man/exa_colors.5 /usr/local/share/man/man5/
# Recreate man db
mandb
sudo mandb
```

Ensure everything works:

```sh
# Ensure exa itself is working
exa
# Ensure man pages are working
man exa
man exa_colors
```

Finally, add aliases to the `~/.bashrc` file:

## [fd](https://github.com/sharkdp/fd)

```Shell
sudo apt install fd-find
ln -s $(which fdfind) ~/bin/fd
```

## [Silver Searcher](https://github.com/ggreer/the_silver_searcher):

```Shell
sudo apt install silversearcher-ag
```

## [nnn](https://github.com/jarun/nnn)

```sh
# Install nnn
sudo apt install nnn
# Install plugins
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
```

## [z.sh](https://github.com/rupa/z):

```sh
wget -P ~/bin/ https://raw.githubusercontent.com/rupa/z/refs/heads/master/z.sh
# Then edit ~/.bashrc to add something like this:
. /path/to/z.sh
```

## [fzf](https://github.com/junegunn/fzf):

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

# [tldr](https://tldr.sh/)

> [!NOTE] 
> Requires node.js

```sh
npm install -g tldr
```

# htop

```sh
sudo apt install htop
```