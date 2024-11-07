# Nerd Fonts

> [!NOTE]
> Full instructions [here](https://www.debugpoint.com/fonts-mint-cinnamon/).

Navigate to [Nerd Fonts](https://www.nerdfonts.com) and download the required fonts. We recommend the following:

- DejaVuSansM Nerd Font
- 0xProto Nerd Font

Unzip the downloaded fonts to a temporary folder and then copy as necessary:

- To install fonts for current user, copy fonts to `~/.fonts`
- To install system wide, copy fonts to `/usr/share/fonts`.

Finally, update the font cache:

```sh
fc-cache -f -v
```

# Microsoft Core Fonts

```sh
sudo apt install ttf-mscorefonts-installer
```
