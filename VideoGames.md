# Video games #

First-person shooter games are a natural fit for Liquid Galaxy, since they're immersive 3-d environments.  Most of them even have a spectator mode built in which does most of what we need.

## Quake 3 ##

|<img src='http://lh6.ggpht.com/_5TvSUp77d78/TLDLVNGRjyI/AAAAAAAABvU/9uc5Wv8C_9M/s400/IMG_20101009_211805.jpg' /> | <a href='http://www.youtube.com/watch?feature=player_embedded&v=Ef-OtbqHEzQ' target='_blank'><img src='http://img.youtube.com/vi/Ef-OtbqHEzQ/0.jpg' width='425' height=264 /></a> <br> Quake3 running on a 5 machine LG, at <a href='http://www.scm.uws.edu.au/'>UWS</a> the rig is called Wonderama</tbody></table>

Thanks to <a href='http://blog.jfedor.org/2010/10/panoramic-quake-3.html'>Jacek Fedorynski</a> via the liquid-galaxy Google Group for creating a loadable Quake 3 Mod (source is available). Instructions are well-written in the linked blogger post complete with a video of it in action.<br />
Briefly:<br>
<br>
<ul><li>With the mod loaded, launch Quake3 with the following command-line options (use your map of choice):<br>
<pre><code>+set fs_game galaxy +set sv_pure 0 +devmap q3dm7<br>
</code></pre>
</li><li>Launch the peripheral spectators and use the console to adjust their views individually:<br>
<pre><code>\connect master_system_ip<br>
\team s<br>
\cg_fov 45<br>
\cg_yawOffset 45<br>
</code></pre></li></ul>

These options could likely be placed into an autoexec.cfg file or added to the command-line.<br>
<br>
Of course, choose an FOV that matches your display setup, and adjust the yawOffset for each device viewing further from the master, or center.<br>
<br>
<h2>Cube 2: Sauerbraten ##

Just for fun, we hacked up the open-source video game [Cube 2: Sauerbraten](http://sauerbraten.org/) so that we could make spectators look to the left or the right of the view of the player they're following.  Here's the [ugly patch against svn](http://code.google.com/p/liquid-galaxy/downloads/detail?name=sauerbraten-viewsync-hack.diff&can=2), which may someday turn into an actual complete feature.

See it in action:

|<a href='http://www.youtube.com/watch?feature=player_embedded&v=rpIkRTbd-0w' target='_blank'><img src='http://img.youtube.com/vi/rpIkRTbd-0w/0.jpg' width='425' height=310 /></a>|
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

To make it work, after patching and compiling the game, set up each machine's Sauerbraten autoexec.cfg like this:
```
fov 36.5
straferoll 0
connect [local server's ip]
fullscreen 0 (due to an SDL bug with rotated screens)
scr_w 1080
scr_h 1920
hudgun 0
setmaster 1
mastermode 2
crosshairsize 0
```

Each slave also needs a "followyaw XX" line telling them to look XX degrees to the left or right.

Start the game first on the main screen, and type `/setmaster 1`, then
`/mastermode 2`, which locks the game so that everybody else
automatically comes up as spectators.  Then start the game on the slave machines.  One of the source hacks makes the slaves automatically follow the master player when they join in spectator mode.

# WebGL Aquarium #

A googler got the [WebGL Aquarium](http://webglsamples.googlecode.com/hg/aquarium/README.html) running on Liquid Galaxy:

|<a href='http://www.youtube.com/watch?feature=player_embedded&v=64TcBiqmVko' target='_blank'><img src='http://img.youtube.com/vi/64TcBiqmVko/0.jpg' width='425' height=292 /></a> <br>WebGL Aquarium running with Chrome<table><thead><th><a href='http://www.youtube.com/watch?feature=player_embedded&v=OnexNRrEGYE' target='_blank'><img src='http://img.youtube.com/vi/OnexNRrEGYE/0.jpg' width='425' height=292 /></a> <br>WebGL Aquarium running with Firefox</th></thead><tbody></tbody></table>

<h1>Second Life - CaveSL</h1>

The University of Southern California Institute for Creative Technologies as part of their <a href='http://projects.ict.usc.edu/force/cominghome/'>Coming Home</a> Project have developed a multi-machine version of Second Life called <a href='http://projects.ict.usc.edu/force/cominghome/cavesl/'>CaveSL</a>. This is well suited to run on a Liquid Galaxy. More details to be posted shortly.<br>
<br>
<table><thead><th><a href='http://www.youtube.com/watch?feature=player_embedded&v=TT6TcMAqOZU' target='_blank'><img src='http://img.youtube.com/vi/TT6TcMAqOZU/0.jpg' width='425' height=264 /></a> <br>CaveSL running at <a href='http://www.scm.uws.edu.au/'>UWS</a> on a 5 machine Liquid Galaxy</th></thead><tbody>