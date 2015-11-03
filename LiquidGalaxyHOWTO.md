## Liquid Galaxy HOWTO ##

If you just want to try out view synchronization, head over to the QuickStart.

This page shows how we keep our sanity while managing multiple machines working together in a Liquid Galaxy.  It's aimed at system administrators.  Don't forget to read up on the SecurityConsiderations, too.

We use Ubuntu Linux for its stability and ease of administration, but the view synchronization features should work just fine on OSX or Windows.

There are lots of ways to build a reliable Liquid Galaxy.  This is just how we do it.



## Electronics ##

Check out the ComputerHardware page for our computer and LCD screen specs.

## Operating System Install ##

We typically start with a [command-line install of Ubuntu](https://help.ubuntu.com/community/Installation/LowMemorySystems) 10.04 ("Lucid").

If you plan to use a [distributed squid proxy](DistributedSquid.md), consider setting the "Typical usage" setting to "news" while partitioning the disk to allocate extra inodes for all the small files squid will create.

Create a user account called "lg" if you want to use our scripts as-is.

Configure LABELs for each of your filesystems so that the disk partitions will mount after cloning the disk to the other machines.  Configure your `/etc/fstab` to mount by `LABEL=*` instead of by `UUID=*`.

Once your system is installed and running, add these packages and allow installation of their dependencies:
```
$ sudo apt-get install xinput lxdm xorg rxvt-unicode fvwm fvwm-icons nitrogen graphicsmagick-imagemagick-compat librsvg2-bin subversion build-essential apache2 php5 php5-cgi xdotool squid3 squid3-cgi
```

### Alternatives System ###

Our scripts utilize the common names of applications as represented in the Debian Alternatives system ([see here](http://www.debian-administration.org/articles/91)).

Update the alternatives on your freshly installed system as follows:
```
$ sudo update-alternatives --set x-window-manager /usr/bin/fvwm2
$ sudo update-alternatives --set x-terminal-emulator /usr/bin/urxvt
$ sudo update-alternatives --set x-www-browser /usr/bin/chromium-browser
$ sudo update-alternatives --set gnome-www-browser /usr/bin/chromium-browser
$ sudo update-alternatives --set lxdm.conf /etc/lxdm/lxdm.conf
```

## Check out the Liquid Galaxy files from git ##

We checked all the scripts and config files into git.  Head over to the
[Source](http://code.google.com/p/liquid-galaxy/source/checkout) tab and check out a local copy.

## Network ##

We use gigabit ethernet to connect the machines in a Liquid Galaxy.  The view synchronization messages are small and Google Earth's bandwidth will be limited by your upstream internet connection, so gigabit ethernet isn't really necessary.

Later, in the [personality assignment](LiquidGalaxyHOWTO#personality_assignment.md) section, we'll set each machine up with an alias interface and a private IP address so that the machines can always reach each other, even if DHCP isn't available.

And as we mentioned earlier, make sure you check out the SecurityConsiderations and make sure you set up your network so that outsiders can't send you unwanted `ViewSync` messages.

## Input Devices ##

If you're planning to use a multi-axis controller, visit the LinuxSpaceNavigator page to set up the `/dev/input/spacenavigator` device our scripts are configured for.

In the source repository: the conf file, `gnu_linux/home/lg/etc/shell.conf` and a helper script, `earth/scripts/write-drivers-ini.sh` work together at launch of Google Earth to configure it to use the specified device.

## Graphical Display ##

  * Configure Xorg with the touchscreen as its "**CorePointer**".

  * If you're using a podium with a [touch screen](TouchScreen.md), and your video card supports multi-headed displays, configure the second video card output for use with the touch screen.

The `/etc/X11/xorg.conf` configuration in the source control repository of this project is just one example and may need to be adjusted dramatically to fit your systems.

## User Account ##

  * Create a user called "`lg`" and rsync `home/lg` from your git checkout to `/home/lg`.
  * Rename the files and directories within the `home/lg/dotfiles` subdirectory to contain a "`.`" (dot) as the first character and place them directly into the user's home directory. (e.g. "`home/lg/dotfiles/fvwm2rc`" becomes "`/home/lg/.fvwm2rc`")
  * Play close attention to `home/lg/dotfiles/xsession`, as this is how the window manager is executed upon auto-login by the Display Manager.

## Apache ##

If you're using a [touch screen](TouchScreen.md) or [squid proxy](DistributedSquid.md), use the files in `gnu_linux/etc/apache2` from your git checkout to configure Apache to listen on port 81 instead of port 80.

## Display Manager ##

Use `gnu_linux/etc/lxdm/lxdm.conf` from your git checkout to configure LXDM to automatically login as the `lg` user and execute a default Xsession. This is how your preferred window manager (and hence the startup-script) will be executed in a minimal installation.

## Window Manager ##

An example configuration for the FVWM2 window manager is included within the `home/lg/dotfiles` directory in the source control repository of this project.

If you use a different window manager, make sure you run `home/lg/bin/startup-script.sh` automatically on login.

## Google Earth ##

`ViewSync` functionality has been in [Google Earth](http://www.google.com/earth/index.html) since version 5.2. Be sure to download the most recent version and look over the license agreement when you download Google Earth if you have any questions about how you can use it.

  * Install Google Earth into a directory called `/home/lg/earth/builds/5.2.X.XXXX`.

  * Create a symlink in `/home/lg/earth/builds` directory:
```
  $ cd /home/lg/earth/builds
  $ ln -s ./5.2.X.XXXX latest
```

This will let our scripts find your Google Earth install.

The `earth/config/master` and `earth/config/slave` directories are used by `run-earth-bin.sh` to overwrite the files in `.config/Google/` before starting Google Earth.

See the [Google Earth ViewSync Document](GoogleEarth_ViewSync.md) for more information on the specific workings of the ViewSync Feature in Google Earth.

## SSH Key setup ##

We use SSH extensively to communicate between galaxy nodes. The source repository contains  a fairly dangerous [clean-ssh.sh](http://code.google.com/p/liquid-galaxy/source/browse/trunk/gnu_linux/home/lg/tools/clean-ssh.sh) file which can be executed with root privileges to initialize various SSH key items including:
  * generating a keypair for the `lg` user.
  * adding the generated keypair to `authorized_keys` files for `root` and `lg` users.
  * generating all-new host keys for sshd.
  * adding the host key to `known_hosts` to squelch warnings.

DO NOT use this script on a server or your own desktop system.<br />
DO use this script BEFORE cloning to make things easy on yourself.

## Machine Cloning ##

Clone the disk of the machine you've completed setting up BEFORE you perform personality assignment in the next section.

Try using dd over netcat, or a g4u boot disk.

Note that udev likes to remember your network hardware's MAC address, so you may need to edit `/etc/udev/rules.d/70-persistent-net.rules` just before cloning, so that the new machines don't end up with, eg., `eth1` instead of `eth0`.

## personality.sh ##

For Galaxy systems fitting the current MechanicalDesign, we've settled upon a clockwise numbering scheme beginning with the "**master**" system as **1**. Connect any input devices, such as a mouse or [multi-axis controller](LinuxSpaceNavigator.md), to "**master**" system.

Setting a personality sets the system hostname and prepares an alias interface ( eth0:0 ) via a new script dropped into `/etc/network/if-up.d`. Scripts in that directory are executed whenever an interface is brought up.

Run this on each machine, where "X" is the screen number (clockwise from the master):
```
   $sudo /home/lg/bin/personality.sh X
```