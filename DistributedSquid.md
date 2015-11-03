# Why Cache? #

Since Liquid Galaxy involves sending multiple computers to the same place at the same time, it's handy to have a web cache to reduce network load.

We use a distributed cache, in which each of the Galaxy machines also runs [squid](http://www.squid-cache.org/). They're set up to peer with each other, so our 8-machine Galaxy also ends up with an 8-machine squid cluster.

There are several ways to do it.  Here's how we did it on Ubuntu GNU/Linux machines.

We provide links to the individual configuration files you'll need, but you may find it easier to just [check out everything](http://code.google.com/p/liquid-galaxy/source/checkout) using git.

# Make sure you're not running a web server on port 80 #

In the next section, you'll see how we run squid on port 80 as a simple hack to avoid setting firewall rules.

If you have a web server running on your machine, squid won't be able to bind to port 80.  We moved apache over to port 81.  You can see how we did that in [the gnu\_linux/etc/apache2 directory in our source repository](http://code.google.com/p/liquid-galaxy/source/browse/trunk/gnu_linux/etc/#etc/apache2).

Make sure you restart apache after changing the config files.  `sudo netstat -nlp |head` can be a handy way to double check whether anything is listening on port 80.

# Set up squid to listen on port 80 #

Google Earth gets almost all its data from kh.google.com.  So rather than doing transparent redirects using a firewall, we just pretend that localhost is kh.google.com, and tell squid to act as a web accelerator on port 80.

In git you can find our [/etc/squid3/squid.conf](http://code.google.com/p/liquid-galaxy/source/browse/trunk/gnu_linux/etc/squid/squid.conf) and [/etc/squid3/cachemgr.conf](http://code.google.com/p/liquid-galaxy/source/browse/trunk/gnu_linux/etc/squid/cachemgr.conf).

They set up squid to listen on port 80 and forward all requests to kh.google.com.

# Put kh.google.com in /etc/hosts #

Next we set up [/etc/hosts](http://code.google.com/p/liquid-galaxy/source/browse/trunk/gnu_linux/etc/hosts) so that kh.google.com resolves to localhost.

But since squid needs to connect to the _real_ kh.google.com, we also create [/etc/hosts.squid](http://code.google.com/p/liquid-galaxy/source/browse/trunk/gnu_linux/etc/hosts.squid), and set up the squid.conf to use that file instead of /etc/hosts.

Note that our /etc/hosts and hosts.squid also include entries for `lg1` through `lg8`, the other machines in the galaxy.  As you can read in the LiquidGalaxyHOWTO, we set up a second IP address for each machine with a static, private IP address so that the machines can always reach each other.  Squid uses those aliases in its peer configuration, so make sure you can `ping lg1` ... `ping lg8`.

# Try it out! #

Restart squid with `/etc/init.d/squid3 restart`, then restart Earth on all the machines.

If you get an error about not being able to reach kh.google.com, you know you have a problem.  Try using a web browser on one of the machines to reach http://kh.google.com.  If you get a Google logo and a "not found" error, you know you can reach kh.google.com successfully.

If you have the Squid CGI scripts installed (squid3-cgi), you can visit the cache manager interface on http://localhost:81/cgi-bin/cachemgr3.cgi (did you remember to move Apache to port 81?).  Click "Continue...", then check out the "peer cache statistics".  You should see each of the peers listed, as well as kh.google.com, and see the cache hit rate for each machines.

Don't expect to see huge hit rates for each peer -- if they're set up right as a distributed cache, then each one will only have one slice of the files you need.  So for an 8-machine galaxy, you'd only expect about 12% cache hit rate for each host (and 0% for the machine you're currently looking at, since it doesn't need to ask itself for files it already has).

# Disable request batching #

Once you have your cache working, you should probably disable request batching.  Google Earth sends requests for multiple chunks of data at a time, improving performance by reducing the effects of network latency.

But squid has no way of separating those chunks out, so Earth only benefits when it happens to request the same batch of chunks.

However, Earth 5.2 includes an option in drivers.ini to disable request batching.  This _reduces_ Earth's performance if it's used without a cache, but can improve performance if you are.

Edit drivers.ini on each machine (or earth/config/drivers\_template.ini if you're using write-drivers-ini.sh as described in the LiquidGalaxyHOWTO), adding the following line to the SETTINGS { } stanza:
```
    Connection/disableRequestBatching = true
```

Restart Earth, and fly around a bit, including somewhere you haven't been before, and verify that the change worked by examining the URLs Earth requests from kh.google.com.  One way to do that is to look at `/var/log/squid3/access.log`.

If you see URLs like these:
```
http://kh.google.com/flatfile?q2-031211201120-q.324
http://kh.google.com/flatfile?f1c-02003332-d.3002.323
```

Then it's working.  If you see multiple long numbers in URLs, then it's probably not working and you should double-check your drivers.ini.

# Keep an eye on performance #

8 machines running Google Earth can generate a lot of network requests.  We found that even when using squid on all 8 machines, sometimes Google Earth would really bog down.  In our case, it turned out that squid was "spindle-bound" -- the hard drives we were using couldn't seek fast enough to keep up with the requests coming from Earth.

The "General runtime information" page in Squid's cachemgr3.cgi is useful for watching squid's performance; in particular, keep an eye on the "Median Service Times" for "Cache Hits"; if cache hits take longer than cache misses, your cache is actually slowing you down!

We found that solid state (SSD) hard drives work great due to their random access performance.  You may also want to use the "`relatime`" or even "`noatime,nodiratime`" mount options to minimize disk activity.

# Common problems #

## Out of memory ##
If you find squid crashing after a few days or weeks, it may be running out of memory.  32-bit OSes can only give about 3GB of RAM to any individual process, and squid needs several percent of the size of its disk cache in RAM to hold the cache index.  This means you may only be able to use, say, 30GB of disk for squid if you're running it on a 32-bit machine.

## Out of inodes ##

Google Earth tends to request small chunks of data, especially if you've disabled request batching.  If you're using ubuntu's default ext3/ext4 filesystem and squid is storing its cache as files on your hard drive (`/var/spool/squid3` by default), you may run out of inodes if you use a very large cache.

The simple thing to do in that case is to clear out the existing cache and reduce the cache size.  But you can also find other options in the squid docs, like using a disk partition directly.

If you have the option of formatting a new disk partition, you can allocate more inodes to support the large number of small files squid will create.  If you do that while installing Ubuntu, for instance, you can set the "Typical usage" to "news".