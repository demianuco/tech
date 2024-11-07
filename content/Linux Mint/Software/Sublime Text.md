
> [!NOTE]
> Full instructions [here](https://www.sublimetext.com/docs/linux_repositories.html)

Install the GPG key:

```sh
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
```

Select the channel to use:

- **Stable**
```sh
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
```
- **Dev**
```sh
echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
```    

Update apt sources and install Sublime Text:

```sh
sudo apt-get update
sudo apt-get install sublime-text
```

If this fails ensure apt is set up to work with https sources:

```sh
sudo apt-get install apt-transport-https
```