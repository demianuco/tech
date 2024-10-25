Optionally copy a good `init.nvim` into the config dir:

```sh
mkdir -p ~/.config/nvim
cp ~/path/to/known/init.nvim ~/.config/nvim/
```

Install neovim:

```sh
sudo apt install neovim
```

Install plugins:

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

The first time you start NeoVim there might be all sorts of errors, which might require several restarts to figure out:

- If it complaints about not finding a color scheme, go into config file (`Space, e, v` or `:EV`) and comment out the appropriate line by adding a hash at the beginning. E.g.: `colorscheme OceanicNext`. Save and restart.
- After restarting NeoVim, Install all plugins by running `:PlugInstall`.
- Edit the config file again to uncomment the color color scheme line commented out above.
- Restarting a final time should make everything look good.

## Configure for root

When using nvim as root, it is nice to have the same configuration. A neat trick is to create a symbolic link from the root nvim config folder to the default user config folder, as follows:

```sh
sudo su
cd ~
mkdir -p ~/.config/nvim/
ln -s /home/demian/.config/nvim/init.vim ~/.config/nvim/init.vim
```