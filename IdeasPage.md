# Liquid Galaxy Project Ideas Page #

<img src='http://lh4.googleusercontent.com/_jn_v5gODYp0/TXs9ZPRUX8I/AAAAAAAABMM/j14uYIzVTR4/s800/sf-pano-1024.jpg' align='center' width='800' height='252'>

A place to list all those cool or wacky ideas you have for Liquid Galaxy rigs. If you have any ideas please send them to the <a href='http://groups.google.com/group/liquid-galaxy'>mailing list</a>.<br>
<br>
Note: This page is derived from our <a href='http://code.google.com/p/liquid-galaxy/wiki/GSoC2011'>Google Summer of Code 2011 Ideas Page</a>.<br>
<br>
<img src='http://lh3.googleusercontent.com/-2ZZKkuiOkgw/TkeMj1RIODI/AAAAAAAABaI/fhssJNm3k2c/s800/LeapFrogGlobeSmall.jpg' align='right' width='208' height='156'>
<h3>New Control Devices</h3>

Most Liquid Galaxy's are controlled by a SpaceNavigator and a touchscreen.  We'd like to see other input devices control Google Earth. Obvious examples include the Wii Remote, Microsoft Kinect, Android phones/tablets, using accelerometers, GPS, head and eye trackers or other novel input.<br>
<br>
<ul><li>Head tracking on a curved screen example - <a href='http://www.youtube.com/watch?v=J5WQ3Ou5hrw'>Uni of Texas ECE Senior Design Competition Entry</a>
</li><li>How about using the <a href='http://www.youtube.com/watch?v=W1KFJPlIL8w'>Leap Frog Interactive Toy Globe</a> or another electronic globe as a controller?</li></ul>

<h3>Panoramic Content Production</h3>

Because Liquid Galaxy uses commodity hardware, we're generally limited to flat display technologies. This means we're displaying multiple flat planar views arranged in a cylinder (rectilinear). However most panoramic content publishers use spherical or cylindrical (curvilinear) projections. Displaying this type of content on a Liquid Galaxy requires conversion to multiple planar views. We'd like to see this process automated as much as possible.<br>
<br>
<ul><li>How can we get content (live or not) from spherical or panoramic cameras eg. <a href='http://www.ptgrey.com/products/spherical.asp'>Point Grey Lady Bug's</a></li></ul>

<h3>System, Network and Caching Performance Monitoring</h3>

We'd like better insight into each level of the Liquid Galaxy stack, especially the multiple levels of caching. A detailed near-real-time performance monitoring solution could help diagnose bottlenecks and configure the <a href='http://www.squid-cache.org/'>Squid</a> HTTP cache for better performance. Metrics from each system should be collected and displayed immediately, including disk usage, networking, CPU and GPU utilization, HTTP cache hits and misses, etc. What is an optimal cache size (or content age) for the google content?<br>
<br>
<img src='http://www.scriptol.com/html5/image/kataspace.jpg' align='right' width='240' height='179'>

<h3>Add or adapt Networked View Synchronisation to other Applications</h3>

Google Earth is certainly a "killer app" for the Liquid Galaxy platform. But there are many applications that could be easily enhanced, coordinating multiple instances rendering portions of a panoramic view. Here's a few ideas we have...<br>
<br>
<ul><li><a href='http://www.mplayerhq.hu/'>MPlayer</a> has already been patched, enabling coordinated playback for PanoramicVideo. However the existing patch works only for video, not audio. Modify MPlayer to also send UDP master packets even if video frames are not available to be rendered ie. during audio file playback. Alternatively, modify <a href='http://www.videolan.org/'>VLC</a> to account for bezels when using “-wall” filter for immersive ultra-widescreen movie display eg. <a href='http://en.wikipedia.org/wiki/Cinerama'>Cinerama</a> epics!</li></ul>

<ul><li>Develop some of the virtual world clients to provide a networked immersive experience on Liquid Galaxy - <a href='http://opensimulator.org/wiki/Main_Page'>OpenSimulator</a>, <a href='http://www.sirikata.com/blog/?p=184'>KataSpace</a> (pictured), <a href='http://projects.ict.usc.edu/force/cominghome/cavesl/index.html'>Cave SecondLife</a>, <a href='http://www.vastpark.com/'>VastPark</a>, <a href='http://fvwc.army.mil/moses/'>MOSES</a>, <a href='http://www.delta3d.org/'>Delta3D</a>.</li></ul>

<ul><li>Enable more Open Source VideoGames and/or Game Engines to run in Liquid Galaxy. For example <a href='http://www.ogre3d.org/'>Ogre3D</a>, <a href='http://red.planetarena.org/'>Alien Arena</a>, <a href='http://springrts.com/'>Spring RTS Engine</a>, <a href='http://irrlicht.sourceforge.net/'>IrrLicht</a>, <a href='http://www.panda3d.org/'>Panda3D</a>, <a href='http://www.flightgear.org/'>FlightGear</a>, <a href='http://www.scorched3d.co.uk'>Scorched3D</a>. Quake 3 and Cube2:Sauer Braten could be used as examples.</li></ul>

<ul><li>Same but for commercial 3D/Game Engines - <a href='http://unity3d.com/'>Unity</a>, <a href='http://www.neoaxis.com/neoaxis'>NeoAxis</a>, <a href='http://www.crytek.com/cryengine'>CryEngine</a>, <a href='http://www.minecraft.net/'>Minecraft</a>, etc.</li></ul>

<ul><li>Document setups for commercial simulation apps that support multiple-machine clusters - such as <a href='http://www.microsoft.com/games/flightsimulatorx/'>FS X</a> and <a href='http://wiki.x-plane.com/Chapter_8:_Expert_Essays#Multiple_Computers.2C_Multiple_Monitors'>X-Plane</a>, surely there are some racing sims?</li></ul>

<ul><li>Enhance WebGL Samples to work on a Galaxy setup similar to how Gregg enhanced the <a href='http://webglsamples.googlecode.com/hg/aquarium/README.html'>WebGL Aquarium</a>. An example WebGL candidate would be something like the <a href='http://bodybrowser.googlelabs.com/'>Google Body browser</a>. Can we develop a JavaScript support library that assists developers working in WebGL (eg. perhaps using Three.JS, SceneJS) too make their applications immersive? Convert eye-candy demo's like <a href='http://ro.me/'>Rome</a> to Liquid Galaxy, see <a href='http://www.chromeexperiments.com/'>Chrome Experiments</a>. Additional webgl apps of worth - <a href='http://wiki.openwebglobe.org/doku.php'>OpenWebGlobe</a>, <a href='http://maps3d.svc.nokia.com/webgl/'>Nokia Maps</a></li></ul>

<ul><li>Use/adapt <a href='http://www.googleartproject.com/'>Google Art Project</a>.</li></ul>

<ul><li>Add viewsync to <a href='http://cesium.agi.com/'>Cesium</a>.</li></ul>

<ul><li>Setup scientific data visualisation applications that could be used in a Liquid Galaxy. Some apps may be fairly straightforward others may require complex configuration or software development. Here are some examples - <a href='http://www.paraview.org/'>ParaView</a>, <a href='http://processing.org/'>Processing</a>, <a href='http://dmx.sourceforge.net/'>Xdmx</a>, <a href='http://chromium.sourceforge.net/'>Chromium</a> (the GL library not the Google one), <a href='http://www.equalizergraphics.com/'>EqualiserGraphics</a>, <a href='http://ivl.calit2.net/wiki/index.php/CalVR'>CalVR suite</a>, <a href='http://www.hlrs.de/organization/av/vis/covise/'>COVISE</a>, <a href='http://www.freevr.org/'>FreeVR</a>, <a href='http://www.mechdyne.com/cavelib.aspx'>Mechdyne CAVElib</a>, <a href='http://vizstack.sourceforge.net/'>CSIRO VizStack</a>, <a href='http://www.vsg3d.com/avizo/standard'>Avizo VSG</a>, <a href='http://www.ossim.org/OSSIM/ossimPlanet.html'>OssimPlanet</a>, <a href='http://www.ks.uiuc.edu/Research/vmd/'>VMD</a>/<a href='http://www.ks.uiuc.edu/Research/namd/'>NAMD</a>, <a href='http://www.blender.org/'>Blender</a>, <a href='http://edu.kde.org/marble/'>KDE Marble</a>, <a href='http://oss.sgi.com/projects/inventor/'>OpenInventor</a>, <a href='http://code.google.com/p/vrjuggler/'>VR Juggler</a>, <a href='http://code.google.com/p/vrkit/'>vrkit</a>, <a href='http://www.sagecommons.org/'>SAGE</a>, <a href='http://syzygy.isl.uiuc.edu/szg/index.html'>Syzygy/Aszgard</a>, <a href='http://doc.coin3d.org/Coin/index.html'>Coin3D</a>, <a href='http://www.amira.com/amira/virtual-reality.html'>Amira (VR option)</a>, <a href='http://www.stellarium.org/'>Stellarium</a>, <a href='http://www.shatters.net/celestia/'>Celestia</a>, <a href='http://www.ballview.org/'>BallView</a>, <a href='http://www.worldwidetelescope.org/'>Microsoft Worldwide Telescope</a></li></ul>

<img src='http://www.solidsmack.com/wp-content/uploads/2010/02/liquid-galaxy-3dconnexion.jpg' align='right'>

<ul><li>A multi-screen YouTube launcher. Synchronise playlists across all the displays. Perhaps when doing a video search show one video on each screen. Chrome/Firefox extension to open windows/tabs on specific LG screens may be useful here.</li></ul>

<h3>Touch Screen Control Enhancements</h3>

<ul><li>Application (Earth/Mplayer/Sauerbraten) “selection” buttons using xdotool to do window searches and map/unmap or similar.<br>
</li><li>Tour Control (not likely feasible).<br>
</li><li>Load/Unload KML from touchscreen.<br>
</li><li>Control standard Google Earth features eg. toggle layers and grid, Sun mode, etc.</li></ul>

<h3>Google Earth Networking & Collaboration Enhancements</h3>

<ul><li>A contributed script called "<a href='http://code.google.com/p/liquid-galaxy/wiki/Viewsyncrelay'>viewsyncrelay</a>” can act as the recipient for the Google Earth ViewSync packets sent by the Google Earth master. The script broadcasts the packets to the slave nodes in a Galaxy setup. As a middle-man the script can potentially alter the values, execute scripts on the clients, collect statistics, trigger sound effects, etc. Help this script grow into a more functional and extensible tool. Must know Perl (or similiar) and be familiar with UDP network communication.</li></ul>

<ul><li>Connect several LG rigs together for shared virtual tours and Google Earth-based field trips. Can probably be achieved by adapting viewsyncrelay.pl and some ViewSync->KML->ViewSync glue.</li></ul>

<ul><li>Immersive multi-screen Google Plus 'Hangout' video conference with friends on a Liquid Galaxy! See <a href='http://www.mirainodenwa.com/e_index.html'>NTT t-Room</a> as an example. <a href='http://evo.caltech.edu/'>EVO</a> or <a href='http://www.accessgrid.org/'>AccessGrid</a> may be options. <a href='http://www.webrtc.rg/'>WebRTC</a> and/or <a href='http://developers.google.com/+/hangouts/'>Hangout API</a> may also help here.</li></ul>

<img src='http://lh4.googleusercontent.com/_jn_v5gODYp0/TXruYrA3rKI/AAAAAAAABL0/mDMD79sRAcA/Gigapan-example.png' align='right'>

<h3>GigaPan Viewer, on Adobe Air</h3>

<ul><li>Add UDP broadcast/receive to <a href='https://github.com/openzoom/gigapan-desktop'>GigaPan Desktop Viewer</a>
</li><li>Update GigaPan Desktop to AIR 2.5 namespace so that it can be made into an Android .apk<br>
</li><li>Extend the AIR usage further to allow Android-controlled (or not) gaming on a Galaxy setup.</li></ul>

<h3>Liquid Galaxy System Deployment Automation</h3>

Presently Liquid Galaxy systems are complex to deploy, requiring several hours of one or more experienced Linux system administrator's time.  This wiki does have installation instructions, but the process could benefit from better automation, testing and documentation.  Features like GUI configuration, or automated, even dynamic personality assignment would put Liquid Galaxy much nearer the reach of enthusiasts.<br>
<br>
<h3>Bring the desktop Google Earth user-interface experience to Liquid Galaxy</h3>

Liquid Galaxy setups are fantastic platforms for showcasing Google layers and datasets. However it is difficult for users to load their own KML, datasets and interact with some features of Google Earth eg. turning on/off specific layers. If LG was as easy to interact with as desktop Google Earth a whole community of education and scientific users would thank you! There are open-source tools that may help here eg. <a href='http://synergy-foss.org/'>Synergy</a> and <a href='http://sikuli.org/'>Sikuli</a>, <a href='http://www.inputdirector.com/'>Input Director</a> (Windows only).<br>
<br>
<h3>Random Ideas...</h3>

<ul><li>HowTo's for running up Liquid Galaxy on non-Linux platforms.<br>
</li><li>Setups for using Google Earth Plugin, not just Google Earth Client or a mix of plugin and client.<br>
</li><li>Build a browser-based mini-Liquid Galaxy using multiple instances of Google Earth Plugin, could be all one machine or across multiple machines. <b>done on UWS Wonderama</b>
</li><li>Look at configurations to support GE-plugin applications, such as <a href='http://www.planetinaction.com/'>PlanetInAction's</a> Ships, Helicopter, Moon Lander.<br>
</li><li>Trigger location-based sound effects using a database of geo-located audio for example, the <a href='http://sounds.bl.uk/uksoundmap/index.aspx'>British Library UK Sound Map</a>, <a href='http://soundscapenetwork.org/'>Global Soundscape Network</a>, <a href='http://urbanremix.gatech.edu/'>UrbanRemix</a>, water splash when diving into ocean, sound of the surf when near the coast, etc. Is <a href='http://pumilio.sourceforge.net/'>Pumilio</a> (an open source soundscape manager) able to export KML which is useful in Google Earth?<br>
</li><li>Investigate potential for <a href='http://mumble.sourceforge.net/'>Mumble</a>, <a href='http://www.teamspeak.com/'>TeamSpeak</a> or <a href='http://www.ventrilo.com/'>Ventrilo</a> for surround/3d locating audio in rig as well as for inter-rig voice communication.<br>
</li><li>Construct a 3D model for calibration of LG rigs. Basically a cylinder with a test pattern, angle of orientation written around it.<br>
</li><li>Investigate getting Space Navigator working in Javascript. Possible path with 3Dx v10 drivers and Javascript joystick emulation.<br>
</li><li>Link with and develop a HowTo Guide for geography teachers & school computer clubs.<br>
</li><li>Further develop real-time in-world Google Earth avatars, currently prototyped using ViewSync->KML. Would be cool for classrooms.<br>
</li><li>Need some way of benchmarking Liquid Galaxy rig overall performance.<br>
</li><li>Method/tool to up-convert and play standard Google Earth Tours so they work well on Liquid Galaxy rigs.<br>
<ul><li>tour control - load/start/pause/speed-up/slow-down/stop/un-load.<br>
</li><li>automaticplacement of bubble popups and audio around the rig.<br>
</li><li>timing of elements for good performance, just-in-time loading.<br>
</li><li>tweaking of elements for immersiveness eg. speed of pans, pano sweeps, use of surround sound.<br>
</li><li>David Tryse's amazing <a href='http://earth.tryse.net/#KML_files'>Google Earth Tours</a> are good candidates for conversion.<br>
</li></ul></li><li>Liquid Galaxy graphic for grub bootloader screen.<br>
</li><li>Use <a href='http://code.google.com/p/clustergl2/'>ClusterGL</a> to setup a flat or curved multi-machine Google Earth wall.<br>
</li><li>Investigate <a href='http://vvvv.org/documentation/boygrouping-basics'>BoyGrouping</a> for clustered displays when using the <a href='http://vvvv.org/'>vvvv</a> real-time vis toolkit.<br>
</li><li>Check multi-machine rendering with <a href='https://github.com/shiffman/Most-Pixels-Ever/'>Most Pixels Ever</a> and <a href='http://polycode.org/'>Polycode</a>.