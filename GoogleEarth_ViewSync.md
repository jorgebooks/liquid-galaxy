# Introduction #

At the core of the Liquid Galaxy experience is the ViewSync feature for Google Earth which synchronizes multiple Google Earth instances across a network. This page talks about various aspects of that feature, and how to operate it.

If you just want to get up to speed quickly, check out the QuickStart.

# Drivers.ini #

drivers.ini is a file in the google earth installation directory that affects the behavior of the client. In the "Settings" section, the following commands enable the viewsync feature and affect its behavior:

```
   ViewSync/send=          <-- put true/false here to enable/disable sending viewsync messages over the network
   ViewSync/receive=       <-- put true/false here to enable/disable receiving
   ViewSync/hostname=      <-- put the host name or IP to send viewsync messages to
   ViewSync/port=          <-- put the port to send/receive viewsync messages on
   ViewSync/yawOffset=     <-- the yaw offset for receiving agents, in degrees
   ViewSync/pitchOffset=   <-- the pitch offset for receiving agents, in degrees
   ViewSync/rollOffset=    <-- the roll offset for receiving agents, in degrees
   ViewSync/horizFov=      <-- the horizontal field of view to use for display
   ViewSync/queryFile=     <-- the query file to poll for commands
```

The [queryFile feature is documented elsewhere](QueryTxt.md).  Also see the LinuxSpaceNavigator page.

# Offset Rotation Order #

Rotation offsets from the master are applied in the following order: **yaw** -> **pitch** -> **roll**.

In other words, the slaves first synchronize to the viewport of the master then yaw by the specified offset, then pitch, then roll.

# ViewSync packet format #

The UDP datagrams used for view synchronization are comma-separated numbers and strings:

counter, latitude, longitude, altitude, heading, tilt, roll, time start, time end, planet name ("sky", "mars", "moon", empty "" is Earth)

```
5090,-33.54948434838393,150.99967479537557,523818.98127554677194,-0.28372808067457,0.00000000000000,0.00000000000000,63454496156,63454496156,
```

note: time values are seconds since 1st Jan year 1 (1/1/1).