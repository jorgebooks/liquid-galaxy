# Google Summer of Code 2013 Liquid Galaxy Project #

<img src='http://lh4.googleusercontent.com/_jn_v5gODYp0/TXs9ZPRUX8I/AAAAAAAABMM/j14uYIzVTR4/s800/sf-pano-1024.jpg' width='800' height='252'>

<h2>What is Liquid Galaxy and the Liquid Galaxy Project?</h2>

Liquid Galaxy is a remarkable panoramic system that is tremendously compelling. It started off as a Google 20% project to run <a href='http://earth.google.com/'>Google Earth</a> coordinated across multiple systems, using COTS (Commodity Off the Shelf) hardware and it has grown from there! Open source applications such as the MPlayer video player have been extended to run on Liquid Galaxy.<br>
<br>
<img src='http://liquid-galaxy.googlecode.com/files/GSoC%202013%20Triple.jpg' align='right' width='360' height='200'>

Liquid Galaxy hardware consists of one or more computers driving multiple displays. Liquid Galaxy applications have been developed using a Master/Slave architecture. The view orientation of each slave instance (display segment) is configured in reference to the view of the master segment. Navigation on the system is done on the master instance and the location on the master is broadcast to the slave instances via UDP packets. The slave instances, knowing their own locations in reference to the master, then change their views accordingly.<br>
<br>
The Liquid Galaxy Project, while making use of Google Earth software, does not develop the Google Earth code-base itself. Google Earth is not open source software, although it is free (as in beer). Instead, the Liquid Galaxy Project works on extending the Liquid Galaxy system with open source software both improving its administration and enabling open source applications, so that content of various types can be displayed in the immersive panoramic environment provided.<br>
<br>
<h2>What kinds of skills, experience should you bring?</h2>

At least one of:<br>
<ul><li>Systems programming in C/C++ or scripting in shell, Python, Perl or other languages.<br>
</li><li>Linux system development, especially input devices and/or X.Org<br>
</li><li>Experience with Google Earth environment, including KML, WMS, Google Earth API, or other technologies used by Google Earth.<br>
</li><li>Technical experience with other panoramic display or panoramic content production systems.</li></ul>


<h2>Who could you be working with?</h2>

<blockquote><img src='http://lh3.googleusercontent.com/_jn_v5gODYp0/TXs78hkdHEI/AAAAAAAABME/ecZRp8djx-o/lg-rig1small.png' align='right'>
<ul><li>Adam Vollrath (<a href='http://www.endpoint.com/team'>End Point</a>, New York)<br>
</li><li>Andreu Ibanez (<a href='http://www.ponent2002.com/'>Ponent 2002</a>, Lleida, Spain)<br>
</li><li>Andrew Leahy (<a href='http://www.uws.edu.au/'>University of Western Sydney</a>, Australia)<br>
</li><li>Ben Goldstein (<a href='http://www.endpoint.com/team'>End Point</a>, New York)<br>
</li><li>Kiel Christofferson (<a href='http://www.endpoint.com/team'>End Point</a>, New York)<br>
</li><li>Matt Vollrath (<a href='http://www.endpoint.com/team'>End Point</a>, New York)<br>
</li><li>Others (To be announced)</li></ul></blockquote>


<h2>What resources are available to help you?</h2>

<ul><li>Access to Liquid Galaxy Installations in Google offices around the world.<br>
</li><li>Assistance setting up your own development Liquid Galaxy in your home, office, or school.<br>
</li><li>Possible loans of equipment.</li></ul>

<h2>Suggested GSoC 2013 Project Ideas</h2>

We have plenty of great things you could work on! Here are our top needs, also make sure to check our complete <a href='http://code.google.com/p/liquid-galaxy/wiki/IdeasPage'>Ideas Page</a>.<br>
<br>
<h3>Improving Navigation & Control</h3>

The primary controller on Liquid Galaxy installations is the 3DConnexion SpaceNavigator, which is a fantastic controller but does take some getting used to. Beginners often find themselves turning up side-down or flying around sideways! We are interested in pursuing other control devices that will work for the mainly Linux installations.<br>
<br>
We are especially keen to see SpaceNavigator control for the Earth API using the HTML5 GamePad API.<br>
<br>
Solutions: possible 'tweaks' to existing SpaceNavigator controls, MS Kinect, other devices? Modifying ViewSync control data. Perhaps writing a driver or 'control layer'.<br>
<br>
<h3>Better handling of panoramic content</h3>

Liquid Galaxy is a fantastic platform for viewing panoramic image content. Unfortunately our current tools for using this type of content are limited. You could work to enhance our current mplayer playback or develop a plugin for another tool, such as <a href='http://hugin.sourceforge.net/'>Hugin</a>, to perhaps generate KML spherical PhotoOverlays.<br>
<br>
Skills needed: a thorough understanding of panoramic imagery and projections, programming experience in whatever tool you think will get the job done, likely C/C++, KML experience.<br>
<br>
<h3>JavaScript based Liquid Galaxy</h3>

We'd like to see a Liquid Galaxy system built using only the Google Earth Plugin with the views synchronised with JavaScript and WebSockets and/or WebRTC Data Channel. In conjunction with this a "ViewSync.js" library could be developed to enable HTML5/WebGL applications to be easily adapted for immersive multi-machine visualisation rigs.<br>
<br>
Skills required: JavaScript, 3D maths, Earth JavaScript API, KML, HTML5, WebSockets, WebRTC.<br>
<br>
<img src='http://lh4.googleusercontent.com/--lzUVe5pJhY/T1lecucI3DI/AAAAAAAACAA/BQ9gl0l3NRs/s400/LG-Tron.jpg' align='right' width='400' height='219'>

<h3>System, Network, and Caching Performance Monitoring</h3>

We'd like better insight into each level of the Liquid Galaxy stack, especially the multiple levels of caching. A detailed near-real-time performance monitoring solution could help diagnose bottlenecks and configure the <a href='http://www.squid-cache.org/'>Squid</a> HTTP cache for better performance.  Metrics from each system should be collected and displayed immediately, including disk usage, networking, CPU and GPU utilization, HTTP cache hits and misses, etc. Hardware benchmarking tools specific for the applications running on the Liquid Galaxy would be useful too.<br>
<br>
Skills required include one or more of the following: Deep understanding of and interest in caching performance, Linux system performance monitoring and visualization, Linux GUI development--X.Org or web.<br>
<br>
<h3>Bringing other applications and system capabilities to Liquid Galaxy</h3>

Put on your thinking cap and come up with a novel application for immersive visualisation on Liquid Galaxy! Examples:<br>
<br>
<ul><li>Multi-screen multi-user Google Hangouts. We'd love to see a multi-screen immersive video conferencing running on Liquid Galaxy using Google Hangouts or WebRTC.</li></ul>

<ul><li>A Hangout gadget for sharing the Google Earth view between multiple participants.</li></ul>

<ul><li>Interactive Games within the Liquid Galaxy Google Earth environment, geography quiz's, hide and seek games?</li></ul>

<ul><li>VJing software development or integration, for which the Liquid Galaxy will be a most impressive platform.</li></ul>

<ul><li>Automated setup and tools for quickly calibrating offsets for the displays on the system.</li></ul>

Various skills required: JavaScript, Hangout API, HTML5, Earth API, WebRTC.<br>
<br>
<h2>Interested? What you have to do next...</h2>

If you want to participate in GSoC either as a student developer or mentor, you may contact us in our freenode IRC channel, #liquid-galaxy, or send an email to lg-gsoc@endpoint.com.<br>
<br>
The Liquid Galaxy Project's Google Summer of Code Timeline will follow GSoC's main timeline here: <a href='http://www.google-melange.com/gsoc/events/google/gsoc2013'>http://www.google-melange.com/gsoc/events/google/gsoc2013</a>


<i>Ben Goldstein & Andrew Leahy (Liquid Galaxy GSoC Project Organizers)</i>