# Download ISO

> [!NOTE]
> Full instructions [here](https://linuxmint-installation-guide.readthedocs.io/en/latest/choose.html).

Choose the right edition, which in my case is Cinnamon, and download it from one of the download mirrors [here](https://www.linuxmint.com/mirrors.php) or [here](https://mirrors.kernel.org/linuxmint/stable/). Don't forget to also download the `.txt` and `.txt.gpg` files required to verify the integrity of the ISO image.

Verify the integrity of the downloaded ISO image by running:

```powershell
# Generate SHA256 hash of ISO image
certutil -hashfile linuxmint-22-cinnamon-64bit.iso sha256
# Compare it to the one in sha256sum.txt
cat sha256sum.txt
```

Check authenticity:

```powershell
# Install gpg if necessary
scoop install gpg
# Import the Linux Mint signing key
gpg --keyserver hkp://keys.openpgp.org:80 --recv-key 27DEB15644C6B3CF3BD7D291300F846BA25BAE09
# Verify authenticity
gpg --verify sha256sum.txt.gpg sha256sum.txt
# The output show say "Good signrature from..." and contain the following
# key fingerprint: 27DE B156 44C6 B3CF 3BD7  D291 300F 846B A25B AE09
```
# Flash ISO

If necessary, **Etcher** ISO flasher using **scoop**:

```powershell
scoop install etcher
```

Then launch **etcher** and flash the Linux Mint ISO image onto an empty USB drive with enough capacity.

# Boot ISO

Shut down the Surface Pro. Start into the BIOS/UEFI screen by pressing and holding the Volume Up key, then pressing and releasing the Power On key, and then finally releasing the Volume Up key when the Windows logo appears.

When entering the BIOS menu, navigate the boot section and change the boot order to make the USB drive the first in the list. Then save and exit, which will reboot the machine.

Insert the USB flash drive in an empty USB port before the machine boots, which will load a boot menu. Select the first option to start a live session from which you will then be able to install Linux Mint.

Install Linux mint as per [instructions](https://linuxmint-installation-guide.readthedocs.io/en/latest/install.html). In my case, I installed over the previous Windows installation, chose the multimedia codecs, 

# Post Installation

## Update packages

```sh
sudo apt update
sudo apt upgrade
```

Alternatively, use **Update Manager** app to install latest updates.

## Hardware drivers

Launch Menu > Administration > Driver Manager and see if any drivers are required.

## Multimedia Codecs

If not done during first installation, install multimedia codecs by Menu > Sound & Video > Install Multimedia Codecs

## Language Support

Launch Menu > Preferences > Languages and install the following languages:

- English, United States
- English, Ireland
- Spanish, Castilian, Spain

If other English and Spanish locales are installed together with the above, you can go ahead and delete them to unclutter the system.

Then, configure the language, region and time format as follows:

- Language: English, United States
- Region: English, Ireland
- Time format: Spanish, Castilian, Spain

If more precise configuration is required, see [[Shell options#Locales]]

## Keyboard

Launch Menu > Preferences > Keyboard > Layouts and add the **English (US, intl. with dead keys)** layout. Then, under Options > Caps Lock behavior >  Make Caps Lock an additional Ctrl.

## Basic Directories

By convention, create certain directories to store apps, bin, etc:

```sh
mkdir -p ~/.ssh
mkdir -p ~/apps
mkdir -p ~/bin
```

## SSH Keys

> [!NOTE]
> More info [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

Generate new SSH key:

```sh
ssh-keygen -t ed25519 -C "demianuco@gmail.com"
```

Optionally, start SSH Agent:

```sh
eval "$(ssh-agent -s)"
```

Add SSH private key to SSH Agent:

```sh
ssh-add ~/.ssh/id_ed25519
```
