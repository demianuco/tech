# Installation

> [!NOTE]
> Full instructions [here](https://jellyfin.org/docs/general/installation/linux/#debuntu-debian-ubuntu-and-derivatives-using-apt).

```sh
curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash
```

Once installed, you can manage the Jellyfin service with:

```sh
sudo systemctl {action} jellyfin
# Where action is: start, stop, reload, restart
```

Open a browser and navigate to [homepage](http://localhost:8096) to complete configuration.

# Library configuration

I recommend creating a special folder for all media served by Jellyfin. This could be created anywhere, but `/home/jellyfin` is a good place as any.

Create folders:

```sh
sudo mkdir -p /home/jellyfin
sudo mkdir -p /home/jellyfin/Videos
sudo mkdir -p /home/jellyfin/Music
```

Make sure the `jellyfin` user and group own the folders:

```sh
sudo chown -R jellyfin:jellyfin /home/jellyfin/
```

When creating a library, add the appropriate folders above. Jellyfin should be able to see it.