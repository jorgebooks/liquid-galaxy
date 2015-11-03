# Quick Start #

Setting up a 2-machine Liquid Galaxy is easy if you have a little networking skill.

If you want to use lots of machines, you'll want to read the [Liquid Galaxy HOWTO](LiquidGalaxyHOWTO.md) to see our tips on managing lots of computers.

But if you just want to make view synchronization work, you've come to the right place!  Have fun experimenting, but don't forget to check out the SecurityConsiderations before you're done.

Here's a short video that demonstrates what this page will let you do (it's actually a link to the youtube page, since we can't embed it here directly):

<a href='http://www.youtube.com/watch?v=I0v4W1ijVLw'>
<img src='http://lh3.ggpht.com/_KkONn6ZFlC4/TJwA9zSb_cI/AAAAAAABtMU/JLKiNO5Jk2E/screenshot.jpg' /></a>

# Install Google Earth #

Start by downloading and installing the most recent release of Google Earth from the [Download page](http://earth.google.com/intl/en/download-earth.html).

Make sure it works by itself on both computers. Then exit out of Earth while you set up the drivers.ini.

# Make sure the computers can reach each other #

Liquid Galaxy works by having a single "master" machine send view synchronization messages over a network to "slave" machines. The messages tell the slaves where the master is in the world and where it's looking.

Find the IP addresses of the two computers you want to use. Here's a page with <a href='http://www.growthhouse.org/ip_address.html'>instructions on finding a computer's IP address for various operating systems</a>.

For example, in Linux, you can find a computer's IP address using the `ifconfig` command:
```
$ ifconfig
eth0      Link encap:Ethernet  HWaddr 90:e6:ba:d4:17:f3  
          inet addr:172.27.210.99  Bcast:172.27.210.255  Mask:255.255.255.0
          inet6 addr: fe80::92e6:baff:fed4:17f1/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:78023599 errors:0 dropped:0 overruns:0 frame:0
          TX packets:52723855 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:41553050982 (41.5 GB)  TX bytes:16376229113 (16.3 GB)
          Interrupt:36 Base address:0x2000 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:26391536 errors:0 dropped:0 overruns:0 frame:0
          TX packets:26391536 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:34488994828 (34.4 GB)  TX bytes:34488994828 (34.4 GB)
```

Ignore the "lo" section; that's for when the computer wants to talk to itself.  If your computer has a wired network connection, you'll probably have an "eth0" interface (or maybe eth1).  If you're using wifi, the interface might start with "wifi", "ath" or "wlan".  The address we want is in the "inet addr" field.  In this case, it's `172.27.210.99`.

We'll show you how to set up the first computer as "master" and the second computer as a "slave".  The slave computer will go wherever the master does, and you normally won't be able to move its viewpoint with your keyboard or mouse; it'll be too busy staying in sync with the master.

Ensure the master can reach the slave over the network by using your system's "ping" command to ping the slave.  For example, if the master's IP is 192.168.1.2 and the slave's IP is 192.168.1.3, you'd run "ping 192.168.1.3" on the master.

If the slave doesn't respond to pings, you'll need to figure out how to make the computers reachable over your network.

Note that many networks, especially networks in people's homes, use <a href='http://en.wikipedia.org/wiki/Private_network#Private_IPv4_address_spaces'>private IP addresses</a>.  That means all the computers on the network appear to have the same IP address when they visit internet sites such as <a href='http://www.whatismyip.com/'>whatismyip.com</a>.  But within the private home network, they have addresses like `192.168.0.1` or `10.0.0.4`, and each computer within the network will have a different one.  That private address is the one you need, not the public one.

# Set up drivers.ini #

Next, we'll turn on the View Synchronization feature in the `drivers.ini`.  You'll find it in the folder where Google Earth was installed.  Remember to exit out of Google Earth before you start editing, and **save a backup copy of drivers.ini before you start editing**.

In Linux, the default location is `/opt/google-earth` (or `/opt/google/earth/free`) if you installed as root, or `$HOME/google-earth` if you installed as yourself.

On a Macintosh, the file should be in `/Applications/Google Earth.app/Contents/MacOS/drivers.ini`

Edit the file `drivers.ini` on the master computer.  In the first stanza, between `SETTINGS {` and `}`, insert the following lines:

```

; ViewSync settings
ViewSync/send = true
ViewSync/receive = false

; If send == true, sets the IP where the datagrams are sent
; Can be a broadcast address
ViewSync/hostname = SLAVE_IP_GOES_HERE
ViewSync/port = 21567

; For video caves, we typically want the slave screens to look to the
; left or right (yawOffset) of where the master is looking
ViewSync/yawOffset = 0
ViewSync/pitchOffset = 0.0
ViewSync/rollOffset = 0.0
ViewSync/horizFov = 36.5

```

Make sure to replace "SLAVE\_IP\_GOES\_HERE" with the slave's IP address.

Now edit `drivers.ini` on the slave.  Insert the same text, but change `ViewSync/send = true` to false, and `ViewSync/receive = false` to true.  Comment out the `ViewSync/hostname` line by putting a `;` in front of it, or just delete that line.

# Try it! #

Cross your fingers for luck and start Google Earth on both computers.  Use the master to go somewhere and the slave should follow along.  Success!


# Look to the left or right #

If you're trying to create an immersive environment, it's not very useful to have all the screens showing the exact same view.

So the next thing you'll want to do is make the slave look to the left or right of the master.  Exit out of Earth and change the slave's `ViewSync/yawOffset` setting in `drivers.ini` to `36.5`.

When you start Earth on the slave, it should show what's exactly to the left of the master's display.

# Synchronize with multiple slaves #

Before you start building your 20-screen video cave, head over to the [Liquid Galaxy HOWTO](LiquidGalaxyHOWTO.md) for tips on setting up lots of computers to work together without driving you crazy.

But briefly, here's how to go beyond 2 screens with view synchronization.

If your machines all live on the same local network, they'll all have the same _broadcast address_.  IP packets sent to this address will be delivered to all computers on the local network.

If, in the master's `drivers.ini` file, you set `ViewSync/hostname` to the broadcast address instead of the IP of a single slave, then the master's UDP location messages will be delivered to every machine on the local network.

In Linux, you can find the broadcast address using `ifconfig`:
```
$ ifconfig
eth0      Link encap:Ethernet  HWaddr 90:e6:ba:d4:17:f3  
          inet addr:172.27.210.99  Bcast:172.27.210.255  Mask:255.255.255.0
          inet6 addr: fe80::92e6:baff:fed4:17f1/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:78023599 errors:0 dropped:0 overruns:0 frame:0
          TX packets:52723855 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:41553050982 (41.5 GB)  TX bytes:16376229113 (16.3 GB)
          Interrupt:36 Base address:0x2000 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:26391536 errors:0 dropped:0 overruns:0 frame:0
          TX packets:26391536 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:34488994828 (34.4 GB)  TX bytes:34488994828 (34.4 GB)
```

The address we want is `172.27.210.255`, in the `Bcast` field for the `eth0` interface, the same interface we used before.

# When you're done #

Once you're done experimenting with the view synchronization features, it's a good idea to turn them off again so that you're not inadvertently sending or receiving view sync messages over the network.  See the [security considerations](SecurityConsiderations.md) for more details.