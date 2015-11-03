<img src='http://lh4.ggpht.com/_oXIW_jM0QDA/Slqv53rWnZI/AAAAAAAAHVI/j7LdOvrE2Ow/s200/IMG_8779.JPG' align='right' />



# Using multi-axis devices with Linux and Google Earth #

Starting with Google Earth for GNU/Linux 5.2.1.1588, it's possible to use multi-axis controllers, such as the <a href='http://www.3dconnexion.com/products/spacenavigator.html'>SpaceNavigator</a> on GNU/Linux systems.

This support relies on the Linux kernel's built-in multi-axis device support, so you **don't** need 3Dconnexion's special SpaceNavigator drivers.

## Make sure your multi-axis device is readable ##

First of all, make sure you **don't** have 3Dconnexion's drivers installed.  The Linux kernel drivers work out of the box, and are what you need for Google Earth.

Recent linux kernels will automatically detect your multi-axis device and create a `/dev/input/eventN` device file, for some value of N.  To avoid having to figure out which file corresponds to your device, create a udev rule that instructs the system to automatically create a `/dev/input/spacenavigator` file whenever your multi-axis device is plugged in.

As root, create a new file called "`/etc/udev/rules.d/90-spacenavigator.rules`" (for example, by typing "`sudo gedit /etc/udev/rules.d/90-spacenavigator.rules`"), containing this single line of text:

```
KERNEL=="event[0-9]*", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c62[68]", MODE="0664", GROUP="plugdev", SYMLINK+="input/spacenavigator"
```

Alternatively, you can get [/etc/udev/rules.d/90-spacenavigator.rules from our git repository](http://liquid-galaxy.googlecode.com/svn/trunk/gnu_linux/etc/udev/rules.d/90-spacenavigator.rules).  Also, it has been reported that this pathname should reliably point to the device, making the udev rule unnecessary:

`/dev/input/by-id/usb-3Dconnexion_SpaceNavigator-event-if00`

Or possibly this pathname (on fedora fc13):

`/dev/input/by-id/usb-3Dconnexion_SpaceNavigator-event-joystick`

Unplug your multi-axis device and plug it back in, and see if a file called "`/dev/input/spacenavigator`" appears (for example, by typing "`ls -l /dev/input/spacenavigator`").

If not, you might want to reboot to make sure your udev rule gets read.  If it still doesn't work, run "`lsusb`" and see if your multi-axis device is listed with "`ID 046d:c626`" (or 046d:c628 for some variants of the SpaceNavigator), matching the `idVendor` and `idProduct` fields in the 90-spacenavigator.rules file.  If they don't match, you might have to change the `idVendor` or `idProduct` field in "`/etc/udev/rules.d/90-spacenavigator.rules`" to match.  You might also try changing 'ATTRS' to 'SYSFS' in both places in the rule.

## (Optionally) disable the device as a mouse ##

Recent versions of xorg automatically detect multi-axis devices and try to use them as mice.  The `xinput` command lets us turn that behavior on and off.

First, install `xinput` if it's not already installed, using your package manager.  (For example, "`sudo apt-get install xinput`").

If you're using a SpaceNavigator, this should make it stop behaving like a mouse until you logout or until you unplug it:
```
xinput set-int-prop "3Dconnexion SpaceNavigator" "Device Enabled" 8 0
```

And this should turn the mouse behavior back on:
```
xinput set-int-prop "3Dconnexion SpaceNavigator" "Device Enabled" 8 1
```

If you're using some other multi-axis device, try running "`xinput list`" to find the name of your device.

## Enable multi-axis support in Google Earth ##

First we'll enable support for the SpaceNavigator by adding some settings to Google Earth's `drivers.ini` file.  Make sure you exit Google Earth before editing your `drivers.ini`.

In Linux, the default location is `/opt/google-earth` if you installed as root, or `$HOME/google-earth` if you installed as yourself.

Open up the drivers.ini using your favorite text editor (for example, "`gedit $HOME/google-earth/drivers.ini`" or "`sudo gedit /opt/google-earth/drivers.ini`"), and add the following lines to the first stanza marked "SETTINGS" (between the { and }).

```
; Settings for multi-axis controllers
SpaceNavigator/sensitivityX = 0.125
SpaceNavigator/sensitivityY = 0.125
SpaceNavigator/sensitivityZ = 0.030

SpaceNavigator/sensitivityPitch = 0.01
SpaceNavigator/sensitivityYaw = 0.004
SpaceNavigator/sensitivityRoll = 0.007
SpaceNavigator/device = /dev/input/spacenavigator

SpaceNavigator/zeroX = 0.0
SpaceNavigator/zeroY = 0.0
SpaceNavigator/zeroZ = 0.0

SpaceNavigator/zeroPitch = 0.0
SpaceNavigator/zeroYaw = 0.0
SpaceNavigator/zeroRoll = 0.0

SpaceNavigator/gutterValue = 0.1
```

Close Google Earth and start it up again, and see if it works!

## Fine-tune the settings ##

Six-axis devices like the SpaceNavigator let you _move_ forward, sideways or up and down (by shifting the puck without tilting), or _rotate_ about each axis to create pitch, yaw and roll (by tilting or twisting the puck without shifting it).

The "sensitivity" parameters let you control how sharply Google Earth will react to your movements in each of those dimensions.

The "zero" parameters let you adjust for a device that doesn't quite rest in the center of its scale.  You shouldn't normally need to change them.

The "gutter" parameter, however, makes a big difference in how responsive the device feels, by creating a "dead zone" near the center of travel.  A larger dead zone means you'll have to move the device farther before Google Earth starts to respond.  If you make the gutter value too low, you may find that Google Earth moves even when you aren't touching the device, due to slight variations in the device's position sensors.

## Troubleshooting ##

If you get stuck, check here for some troubleshooting tips:
https://groups.google.com/group/liquid-galaxy/browse_thread/thread/4e1750fa0e01e60f

In particular,

### New kernels + Earth 5.2 ###

Linux kernels version 2.6.33 and newer changed from reporting spacenav events as EV\_REL to the more correct EV\_ABS.  This is fixed in Earth 6.0 (it accepts either type of event).

### Non-english locales break SpaceNavigator ###

Stefan Dröge reports that setting the "LANG" environment variable to something other than "C" breaks multi-axis support in Linux:

http://code.google.com/p/earth-issues/issues/detail?id=1114