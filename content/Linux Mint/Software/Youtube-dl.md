> [!NOTE]
> Full instructions [here](https://github.com/yt-dlp/yt-dlp).

# Installation

Installed binaries:

```sh
cd ~/bin
wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp
chmod a+rx yt-dlp
```

# Ffmpeg path

As explained [here](https://github.com/yt-dlp/FFmpeg-Builds?tab=readme-ov-file#ffmpeg-static-auto-builds), one should download the a patched version of ffmpeg.

> [!NOTE]
> Before patching make sure ffmpeg is installed using Sofware Manager.

Navigate to [patch site](As explained [here](https://github.com/yt-dlp/FFmpeg-Builds?tab=readme-ov-file#ffmpeg-static-auto-builds), one should download the a patched version of ffmpeg.
) and download patch:

```sh
cd ~/Downloads
wget https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-gpl.tar.xz
ffmpeg-master-latest-linux64-gpl.tar.xz
```

Then manually copy the extracted contents onto the target locations (keeping a copy of the original, just in case):

```sh
# Backup originals
sudo mv /bin/ffmpeg /bin/ffmpeg.original
sudo mv /bin/ffplay /bin/ffplay.original
sudo mv /bin/ffprobe /bin/ffprobe.original
# Overwrite with patched versions
cd ~/Downloads/ffmpeg-master-latest-linux64-gpl
sudo cp ./bin/* /bin/
# Copy man files
sudo mkdir -p /usr/local/man/man1
sudo cp ./man/man1/* /usr/local/man/man1
sudo mkdir -p /usr/local/man/man3
sudo cp ./man/man3/* /usr/local/man/man3
# Recreate man db
mandb
sudo mandb
```

