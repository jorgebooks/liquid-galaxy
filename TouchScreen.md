Some of our Liquid Galaxy installations use an [Acer T230H](AcerT230H.md) touch screen to display a menu of places to go and an on-screen keyboard for searching:

<img src='http://lh5.ggpht.com/_oXIW_jM0QDA/TJuubCiJ6-I/AAAAAAAAVS8/mlLEJ4TFT80/s400/touchscreen-screenshot.jpg' align='center' />

In our [git repository](http://code.google.com/p/liquid-galaxy/source/checkout), you'll find a [php-interface directory](http://code.google.com/p/liquid-galaxy/source/browse/#svn/trunk/php-interface), with a few simple PHP scripts and HTML pages.  These live on the "`master`" computer, and create [query.txt](QueryTxt.md) files that tell Google Earth where to go.  Make sure you read up on the SecurityConsiderations, since anybody who can access the HTML and PHP will be able to use the interface.

The computer driving the touch screen (on the second display connector of the graphics card - see our [xorg.conf](http://code.google.com/p/liquid-galaxy/source/browse/trunk/gnu_linux/etc/X11/xorg.conf)) then displays a web browser (we use [chrome](http://www.google.com/chrome)) in full-screen mode.

The astute reader might think, "Hey! Google Earth and all of the helper scripts are running as the `lg` user, how do you handle permissions issues for the QueryTxt file?". Well, both the `www-data` and `lg` users can read and execute items within the `/lg` directory. So we've placed a small setuid-root binary ([chown\_tmp\_query.c source](http://code.google.com/p/liquid-galaxy/source/browse/trunk/gnu_linux/home/lg/bin/chown_tmp_query.c)) within `/lg` which sets ownership and permissions of the query file written by the PHP interface before renaming the query file to be consumed by Google Earth.

We mount the touch screen on a podium.  Here's a [sketchup model of a podium we built from cabinet plywood](http://code.google.com/p/liquid-galaxy/downloads/detail?name=galaxy-podium-parts.skp&can=2&q=) and painted black:

<img src='http://lh6.ggpht.com/_oXIW_jM0QDA/TJuzMIOqmsI/AAAAAAAAVTM/5E_IY4aXmjE/s400/podium.jpg' align='center' />