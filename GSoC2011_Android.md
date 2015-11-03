# Introduction #


This project's goal is to enable the control of Google Earth (and thus Liquid-Galaxy) with Android devices. There are two main parts of this project: a client-side application on the Android device which generates input, and a server-side application on the master computer which parses the input from the client device and emulates a LinuxSpaceNavigator.
<table cellpadding='5' align='right'>
<tr><td><a href='http://www.youtube.com/watch?feature=player_embedded&v=Dr5bxHoPCfM' target='_blank'><img src='http://img.youtube.com/vi/Dr5bxHoPCfM/0.jpg' width='425' height=344 /></a>
</td></tr>
</table>
The source code for the Android app can be found here [https://github.com/reesebutler/Android-accelerometer-and-touch-screen-control](https://github.com/reesebutler/Android-accelerometer-and-touch-screen-control) and I have been keeping a blog here [http://reese-butler.tumblr.com](http://reese-butler.tumblr.com)
<br />
<br />

# Details #

Currently both the app and server are fairly well polished and functional, so only small changes are being made now. The app can be found in the Android Market under the name "Google Earth Remote".

The app:
  * It gets 5 axes of control (x, y, z, pitch, and roll) from a combination of its orientation values and from touch-screen values. 5 axes are used instead of 6 because GE itself only uses 5 axes of control.
  * The raw data is sent using TCP/IP to the server (master computer). This server is specified by entering the IP address, port, and keycode (if any) on the connection screen.
  * Waits for a reply from the server after each packet of data is sent. This reply is used to quickly determine if the app is still connected to the server.

The server:
  * Receives each packet of data and scales or transforms values as appropriate.
  * Creates a new InputEvent from these values and then writes the InputEvent to the specified named pipe. GE then gets its input by reading from that same pipe.

I was originally planning to use both accelerometer and orientation data from the Android's sensors, but I decided that wii-mote-esque waving motions would not offer a very high level of control or comfort while controlling GE. So I am not going to use the accelerometer values, although for now I will leave the accelerometer-specific code in the source, just in case.