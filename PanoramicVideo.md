# Synchronized video with VLC #

Andrew Leahy at the University of Western Sydney shows in this
<a href='https://groups.google.com/group/liquid-galaxy/browse_thread/thread/c136f757c94dc204'>liquid-galaxy forum thread</a> how to stream a Cinerama movie from a server to multiple machines:

<img src='http://lh4.ggpht.com/_KkONn6ZFlC4/TLPVDgHKk7I/AAAAAAABtQw/z8omjHczQcw/s800/UWS-LG-Cinerama.jpg' />

# Synchronized video with mplayer #

Liquid Galaxy actually started out as a project to review [Street View](http://maps.google.com/help/maps/streetview/) data, using [mplayer](http://www.mplayerhq.hu) to play flipbooks made from street view panoramas:

<a href='http://www.youtube.com/watch?v=RKAbeYUIff4'>
<img src='http://lh3.ggpht.com/_oXIW_jM0QDA/TIbRyiCaxqI/AAAAAAAAVQ4/f4bY3uWNZwg/mplayer.jpg' />
</a>

We submitted the patch to mplayer, and they accepted it a few years ago,   so it's probably in your favorite distribution by now, but if not, you can [compile mplayer from source](http://www.mplayerhq.hu/design7/dload.html).

The patch includes documentation on the new `-udp-ip`, `-udp-master`, `-udp-port` and `-udp-slave` command-line flags.  Briefly,

  * On each slave machine, run: `mplayer -udp-slave foo.avi`.  An empty frame will come up, waiting for instructions from the master.

  * On the "master" machine, run: `mplayer -udp-ip IP -udp-master foo.avi`, where IP is the address of a slave or the broadcast address for the local network.

You can play, pause, seek, or quit the master, and all the slaves will follow.