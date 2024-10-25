# Client

> [!NOTE]
> Refer to [this guide](https://github.com/abraunegg/onedrive/blob/master/docs/ubuntu-package-install.md) for full instructions

```sh

# Step 1: Add the OpenSuSE Build Service repository release key
wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_24.04/Release.key | gpg --dearmor | sudo tee /usr/share/keyrings/obs-onedrive.gpg > /dev/null
# Step 2: Add the OpenSuSE Build Service repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_24.04/ ./" | sudo tee /etc/apt/sources.list.d/onedrive.list
# Step 3: Update your apt package cache
sudo apt-get update
# Install onedrive
sudo apt install --no-install-recommends --no-install-suggests onedrive
```

Authorize app by simply running it for the first time:

```sh
onedrive
```

This will produce an authentication URL. Click on it, follow usual login to OneDrive, and after successfully completing the steps, you will end up on a blank page in the browser. Copy the URL of this blank page and paste it back on the terminal to complete authentication.

Create `~/.config/onedrive/config` configuration file with the following contents:

```
enable_logging = "true"
```

Create `~/.config/onedrive/sync_list` configuration file with the following contents:

```
# Exclusions before inclusions
!/Personal Vault/
/Public/
```

Ensure the existence of log directory:

```sh
sudo mkdir -p /var/log/onedrive
sudo chown root:users /var/log/onedrive
sudo chmod 0775 /var/log/onedrive
```

# First sync

Do a first time sync (the `--resync` is required as the config file was changed after installation):

```sh
onedrive --sync --resync
```

From then on, you have two options:

```sh
# To do a manual sync
onedrive --sync
# To constantly monitor changes and sync
onedrive --monitor
```

However, we recommend running the monitoring option as a service (see below).


> [!NOTE]
> Every time the `sync_file` is changed you will have to use the `--resync` option.

# Service

Enable the systemd service:

```sh
systemctl --user enable onedrive
systemctl --user start onedrive
```

To monitor service:

```sh
systemctl --user status onedrive.service
```

To observe application log:

```sh
journalctl --user-unit=onedrive -f
```

Although we recommend monitoring log as explained below

# Log Monitoring

The OneDrive client has a link to a script that parses and colorizes the application log displayed by `journalctl`.

Install prerequisites:

```sh
sudo apt install ccze
```

Download script:

```sh
wget -P ~/bin/ https://github.com/zzzdeb/dotfiles/blob/master/scripts/tools/onedrive_log
chmod +x ~/bin/onedrive_log
```

From then on, to view log, simply invoke the script (assuming `~/bin/` is in the `PATH`):

```sh
onedrive_log
```

One call also create a shortcut to invoke this script. Launch Menu > Preferences > Keyboard > Shortcuts and create a shortcut with the following options:

	Name: Show OneDrive Log
	 Command: gnome-terminal -- bash -c "~/bin/onedrive_log"
	 Keyboard binding: Shift+Ctrl+Alt+L

# OneDrive GUI (optional)

> [!NOTE]
> Refer to [this guide](https://github.com/bpozdena/OneDriveGUI) for full instructions.

Download the latest `OneDriveGUI-*-x86_64.AppImage` from the [release assets](https://github.com/bpozdena/OneDriveGUI/releases):

```sh
cd Downloads
```

Make the .AppImage file executable with `chmod +x ./OneDriveGUI-<version>-x86_64.AppImage` and run it.

