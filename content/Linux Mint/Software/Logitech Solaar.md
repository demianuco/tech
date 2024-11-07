Use Software Manager to install [Solaar](https://pwr-solaar.github.io/Solaar/). Note that this should result in a new icon in the taskbar which allows you to see the status of Logitech devices.

Solaar can be used to configure the mouse buttons of MX Wireless devices, though one must be aware of how buttons are named in Solaar:

- "Mouse Gesture Button" refers to the thumb button
- "Smart Shift Button" refers to the small button at the top of the mouse that controls ratcheting.

## Configure Thumb Button

A typical configuration I like is to configure the thumb button to perform a "Ctrl+W" key combination, which is useful to close the active window. Doing this in Solaar requires the following steps:

- Launch Solaar and click on the MX Button to configure (e.g. MX Master 2S).
- Click on the padlock icon to the right of "Key/Button Diversion" until it appears "unlocked".
- On the "Key/Button Diversion" section, select the "Mouse Gesture Button" from the first drop-down box, then select "Diverted" from the second drop-down box.
- Click on "Rule Editor" button at the bottom of the app.
- Add a new "Rule" under "User-defined rules".
- Add a new "Key" condition under the new rule. Select "Mouse Gesture Button" in the search box of the new key, and then select the "Key up" option at the right.
- Ass a new "Key press" action under the condition above, the select "Control_L" as the first key, and "w" as the second key (you will need to click on "Add Key" to add a second key).
- Click on "Save changes" at the top of the window for the changes to take effect.