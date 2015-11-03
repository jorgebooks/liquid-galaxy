# Setting up Microsoft WorldWide Telescope for Liquid Galaxy #

<img src='http://eresearch.uws.edu.au/public/wonderama/WWT-Stars1-post.jpg'>

Microsoft Research's WorldWide Telescope is a great program to run on an immersive setup like Liquid Galaxy. The application was developed to not only run on desktops but also on multi-projector domed planetariums. A cylindrical immersive display is also very effective. Considering that Google Sky does NOT work for Liquid Galaxy it's great to have this application for astronomy demonstrations.<br>
<br>
WWT is a Windows app, so this setup is only for Windows Liquid Galaxy rigs. I haven't tried running it under WINE or virtual machine under Linux.<br>
<br>
WWT operates in a similar fashion to Liquid Galaxy supporting networked view synchronization.  The view master machine can be a machine in the rig or a separate instance of WWT. UDP broadcast are sent from the master to 255.255.255.255:8087. If you have a firewall running, make sure to let those packets in.<br>
<br>
WWT also supports Space Navigator controller.<br>
<br>
For questions about WWT, I can recommend this <a href='http://social.microsoft.com/Forums/en-US/worldwidetelescope/threads'>WWT Forum</a> and the <a href='http://www.worldwidetelescope.org/help/SupportHelp.aspx?Page=UserGuide'>WWT UserGuide</a>. Information about setting up multi-machine clusters starts <a href='http://www.worldwidetelescope.org/help/SupportHelp.aspx?Page=UserGuide#MultiMonitorCluster'>here</a>.<br>
<br>
<h2>Step-by-step HowTo for a Liquid Galaxy configs</h2>

0. You will need to be running Windows operating system, with inter-machine networking and an Internet connection.<br>
<br>
1. Download and install WWT on each machine in the cluster <a href='http://www.worldwidetelescope.org/'>http://www.worldwidetelescope.org/</a>

You can check that things basically work by starting up WWT and having a play around.<br>
<br>
2. Create an empty C:\wwtconfig\ folder on each machine.<br>
<br>
3. If you start/stop WWT now it will create a default "config.xml" in this folder. You can either modify this file or copy from the examples below.<br>
<br>
Key config.xml values to be aware of:<br>
<br>
<b>ClusterID</b> is the same for all machines the group.<br>
<br>
<b>NodeID</b> must be a unique number for each screen/PC.<br>
<br>
<b>Master</b> true/false, this should be obvious!<br>
<br>
<b>Heading</b> (in degrees) same as YawOffset in Google Earth drivers.ini.<br>
<br>
<b>UpFov</b> and <b>DownFov</b> set these as needed for your setup.<br>
<br>
<b>Aspect</b> is aspect ratio of the screen that that particular WWT will be displaying on. Use 0.5625 for the portrait 16:9 screens typically used on Liquid Galaxy.<br>
<br>
4. On the WWT view master create C:\wwtconfig\config.xml.<br>
<br>
This is the config from the laptop I run as the view master (<b>Master=True</b>). It has a 16:10 screen, hence the aspect is 1.6.<br>
<br>
<pre><code>&lt;?xml version="1.0" encoding="utf-8"?&gt;<br>
&lt;DeviceConfig&gt;<br>
&lt;Config&gt;<br>
&lt;Device ClusterID="1" NodeID="-1" NodeDiplayName="" MonitorCountX="1"<br>
MonitorCountY="1" MonitorX="0" MonitorY="0" Master="True" Width="1"<br>
Height="1" Bezel="1" ConfigFile="" BlendFile="" DistortionGrid=""<br>
Heading="0" Pitch="0" Roll="0" UpFov="20" DownFov="20"<br>
MultiChannelDome="True" DomeTilt="0" Aspect="1.6"&gt;&lt;/Device&gt;<br>
&lt;/Config&gt;<br>
&lt;/DeviceConfig&gt;<br>
</code></pre>

5. On each WWT slave machine create C:\wwtconfig\config.xml<br>
<br>
This config is from the machine just to the left of center on my setup.<br>
You will want to change <b>NodeID</b> and <b>Heading</b> for each slave. <b>UpFov</b> and <b>DownFov</b> will also need to be tweaked for your screens. Also note that <b>Master=False</b> on slave screens. Our screens are rotated to portrait so the aspect is 9:16 or 0.5625.<br>
<br>
<pre><code>&lt;?xml version="1.0" encoding="utf-8"?&gt;<br>
&lt;DeviceConfig&gt;<br>
&lt;Config&gt;<br>
&lt;Device ClusterID="1" NodeID="1" NodeDiplayName="" MonitorCountX="1"<br>
MonitorCountY="1" MonitorX="0" MonitorY="0" Master="False" Width="1"<br>
Height="1" Bezel="1" ConfigFile="" BlendFile="" DistortionGrid=""<br>
Heading="24.5" Pitch="0" Roll="0" UpFov="18" DownFov="18"<br>
MultiChannelDome="True" DomeTilt="0" Aspect="0.5625"&gt;&lt;/Device&gt;<br>
&lt;/Config&gt;<br>
&lt;/DeviceConfig&gt;<br>
</code></pre>

6. Start WWT on each machine, doesn't matter which order.<br>
<br>
7. On the WWT master set <b>Settings -> Advanced -> Master Controller</b> to enabled (ticked).<br>
<br>
8. From now on control of the "view" will come from the master, the slaves will automatically start full-screen with the mouse-cursor disabled. You can start the guided tours from the master and the slaves will follow along, <b>brilliant!</b>

<h3>Things to work on or add</h3>

<ul><li>compare WWT sync packet with the LG viewsync. Can we control WWT from LG - and vice versa? Especially for the WWT Earth Mode which doesn't navigate as fluidly as Liquid Galaxy.<br>
</li><li>WWT guided tours are just like Google Earth tours. What can we learn/share?<br>
</li><li>Some of the text and overlay content from WWT Guided tours are not shown on slave displays.<br>
</li><li>Kinect control. Space Navigator and XBox controllers work - little confusing but okay.<br>
</li><li>document external HTTP caching setup. WWT content comes from varying servers, watch the access and tweak refresh_patten to make some things more sticky.</li></ul>


<h2>More pics of WWT on the UWS Wonderama rig</h2>

Saturn in Planet mode:<br>
<br>
<img src='http://eresearch.uws.edu.au/public/wonderama/WWT-Saturn-post.jpg'>

Solar System mode (planet sized exaggerated):<br>
<br>
<img src='http://eresearch.uws.edu.au/public/wonderama/WWT-Solar-post.jpg'>

Mt Fuji in Earth mode, using Virtual Earth imagery. Watch out Google, Microsoft want in on the Liquid Galaxy space!<br>
<br>
<img src='http://eresearch.uws.edu.au/public/wonderama/WWT-Fuji-post.jpg'>