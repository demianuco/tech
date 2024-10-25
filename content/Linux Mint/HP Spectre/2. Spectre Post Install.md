

# Configure NVIDIA Settings

The default installation should correctly detect both the incorporated Intel graphics card, as well as the NVIDIA Graphics card.

After first boot, launch Menu > Driver Manager and ensure the latest NVIDIA graphics drivers are installed. In my case, it was `nvidia-driver-550`.

With the correct driver installed, you should see a little system tray icon on the bottom right with either the Intel or the NVIDIA logos in it. This allows you to quickly switch between the two graphics card.

The Intel graphics cards is less capable but consumes less energy and is therefore recommended when using the laptop on the road. The NVIDIA graphics cars is more capable but consumes more energy, and should only be used when necessary, or when connected to an external display, as it turns out that this is the only graphics card that can support variable DPI scaling. 

While one can switch between using the Intel and the NVIDIA drivers by using the system tray icon, it does require logging out before the changes take effect. Therefore, we recommend using NVIDIA when at home and connected to an external display, and Intel otherwise.

# Configure external monitor

> [!NOTE]
> As discussed above, we must used the NVIDIA graphics card when connected to an external display, especially if it has variable scaling.

In the case of the Samsung 49" ultra-wide monitor, the correct configuration can be achieved with:

```sh
xrandr --output HDMI-0 --mode 5120x1440 --fbmm 1193x336 --pos 0x0 --scale 2x2 --output eDP-1-1 --mode 3840x2160 --fbmm 344x194 --pos 3200x2880 --scale 1x1
```

> [!NOTE]
> The above assumes that internal display is called `eDP-1-1` and the external display is called `HDMI-0`. If not, check the correct names by running `xrandr`.
