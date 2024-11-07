## Calendar

Right-click on calendar on bottom-right of taskbar and configure as follows:

- Show calendar events: yes
- Show week numbers in calendar: no
- Use a custom date format: yes
- Date format: %Y-%m-%d / %H:%M
- Date format for tooltip: %A, %e %B %Y / %H:%M

# Locales

> [!NOTE]
> Details on locales can be found in Locale Helper:
> - [en_US](https://lh.2xlibre.net/locale/en_US/)
> - [en_IE](https://lh.2xlibre.net/locale/en_IE/)
> - [es_ES](https://lh.2xlibre.net/locale/es_ES/)

To see the current locale settings:

```sh
locale
```

To edit the current locale settings, edit `/etc/default/locale` and choose a locale for each setting. This is the recommended settings for me:

```
LANG=en_US.UTF-8
LANGUAGE=en_US:en
LC_NUMERIC=en_IE.UTF-8
LC_TIME=en_IE.UTF-8
LC_MONETARY=en_IE.UTF-8
LC_PAPER=es_ES.UTF-8
LC_IDENTIFICATION=es_ES.UTF-8
LC_NAME=es_ES.UTF-8
LC_ADDRESS=es_ES.UTF-8
LC_TELEPHONE=es_ES.UTF-8
LC_MEASUREMENT=en_IE.UTF-8
```

After editing and saving the file, run the following command to update the environment:

```sh
sudo update-locale
```

> [!NOTE]
> This will fail if the three locales `en_US`, `en_IE` and `es_ES` are not installed in the system.

Then restart your system or log out and log back in for changes to take effect.