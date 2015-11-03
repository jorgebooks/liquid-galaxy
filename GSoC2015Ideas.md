# Google Summer of Code Liquid Galaxy Project Ideas Page #

<img src='http://lh4.googleusercontent.com/_jn_v5gODYp0/TXs9ZPRUX8I/AAAAAAAABMM/j14uYIzVTR4/s800/sf-pano-1024.jpg' width='800' height='252'>

<h2>What is Liquid Galaxy and the Liquid Galaxy Project?</h2>

Liquid Galaxy is a remarkable panoramic system that is tremendously compelling. It started off as a Google 20% project to run <a href='http://earth.google.com/'>Google Earth</a> coordinated across multiple systems, using COTS (Commodity Off the Shelf) hardware and it has grown from there! Open source applications such as the MPlayer video player have been extended to run on Liquid Galaxy.<br>
<br>
Liquid Galaxy hardware consists of one or more computers driving multiple displays. Liquid Galaxy applications have been developed using a Master/Slave architecture. The view orientation of each slave instance is configured in reference to the view of the master segment. Navigation on the system is done on the master instance and the location on the master is broadcast to the slave instances via UDP. The slave instances, knowing their own locations in reference to the master, then change their views accordingly.<br>
<br>
The Liquid Galaxy Project, while making use of Google Earth software, does not develop the Google Earth code-base itself. Google Earth is not open source software, although it is free (as in beer). Instead, the Liquid Galaxy Project works on extending the Liquid Galaxy system with open source software both improving its administration and enabling open source applications, so that content of various types can be displayed in the immersive panoramic environment provided.<br>
<br>
<img src='https://developers.google.com/open-source/soc/images/gsoc2015-300x270.jpg' align='right'>
<h2>What kinds of skills or experience should you bring?</h2>

<ul><li>Programming in JavaScript and/or systems programming in C/C++, Python or other languages.<br>
</li><li>Linux system development, especially input devices and/or X.Org<br>
</li><li>Experience with Google Earth environment, including KML or other geospatial formats.<br>
</li><li>Technical experience with other panoramic display or panoramic content systems.</li></ul>

<h3>What resources are available to help you?</h3>

Although we expect students will have enough hardware themselves (or through their school) to develop their project, in some circumstances we may be able to assist with loans of equipment. We can certainly arrange visits to Liquid Galaxy systems if one is in your area.<br>
<br>
<h2>Suggested GSoC 2015 Project Ideas</h2>

We have plenty of great things you could work on! Here are our top needs, also make sure to check our complete <a href='http://code.google.com/p/liquid-galaxy/wiki/IdeasPage'>Ideas Page</a>.<br>
<br>
<h3>Enabling other apps for Liquid Galaxy</h3>

<img src='http://lh3.googleusercontent.com/_jn_v5gODYp0/TXs78hkdHEI/AAAAAAAABME/ecZRp8djx-o/lg-rig1small.png' align='right'>
Getting other applications to work on Liquid Galaxy is always valuable to the Galaxy community. A good example of an application we have one our list is the open source virtual globe <a href='http://cesiumjs.org/'>Cesium</a>. If you have experience coding with Cesium or are willing to learn, please talk to us.<br>
<br>
<i>Skills: developer experience with an app or engine that could benefit from working on Liquid Galaxy.</i>

<h3>Improving Navigation & Control</h3>

The primary controller on Liquid Galaxy installations is the 3DConnexion SpaceNavigator, which is a fantastic controller but does take some getting used to.  We are especially keen to see SpaceNavigator control implemented with HTML5 GamePad API and web-based 3D apps like Cesium or even some neat webgl demos.<br>
<br>
Solutions: possible 'tweaks' to existing SpaceNavigator controls, MS Kinect, other devices? Modifying ViewSync control data. Perhaps writing a driver or example camera control logic.<br>
<br>
<i>Skills: JavaScript, trigonometry.</i>

<h3>Liquid Galaxy with Google Interactive Spaces Project</h3>

Google has a related open-source project called <a href='http://www.interactive-spaces.org/'>Interactive Spaces</a> which is used in the Google Experience Centers. We'd like to see tighter integration between IS and Liquid Galaxy systems.<br>
<br>
<i>Skills: Java, ROS.</i>

<h3>Improved handling of panoramic content</h3>

Liquid Galaxy is a fantastic platform for viewing panoramic image and video content. Our current tools for viewing panoramic content can always benefit from new ideas and features. We are looking for students willing to work software such as <a href='https://code.google.com/p/liquid-galaxy/wiki/Peruse_a_Rue'>Peruse-a-Rue</a> and <a href='https://github.com/mpetroff/pannellum'>Pannellum</a>.<br>
<br>
<i>Skills: a good understanding of panoramic imagery and projections, programming experience in whatever tool you think will get the job done!</i>

<img src='http://lh4.googleusercontent.com/--lzUVe5pJhY/T1lecucI3DI/AAAAAAAACAA/BQ9gl0l3NRs/s400/LG-Tron.jpg' align='right' width='400' height='219'>

<h3>Bringing other applications and system capabilities to Liquid Galaxy</h3>

Put on your thinking cap and come up with a novel application for immersive visualisation on Liquid Galaxy! Examples:<br>
<br>
<ul><li>Multi-screen multi-user Google Hangouts. We'd love to see a multi-screen immersive video conferencing running on Liquid Galaxy using Google Hangouts or WebRTC.</li></ul>

<ul><li>Interactive games using Google Earth or Street View environment, geography quiz's, hide and seek games, such as GeoGuessr.</li></ul>

<ul><li>VJ'ing software development or integration, for which the Liquid Galaxy will be a most impressive platform.</li></ul>

<ul><li>Automated setup and tools for quickly calibrating offsets for the displays on the system.</li></ul>

<i>Various skills required: JavaScript, Hangout API, HTML5, WebRTC.</i>

<h2>Interested? What you have to do next...</h2>

If you want to participate in GSoC either as a student developer or mentor, contact us in our freenode IRC channel, #liquid-galaxy, or email <a href='mailto:lg-gsoc@endpoint.com'>lg-gsoc@endpoint.com</a>.<br>
<br>
Good Luck!<br>
<br>
<i>Ben Goldstein & Andrew Leahy (Liquid Galaxy Project GSoC Organizers)</i>