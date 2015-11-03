Although we've been careful to implement the Liquid Galaxy features as correctly and safely as we can, they are still experimental, and not entirely bug free.

If you choose to turn them on (as described in the QuickStart), you'll need to control network access to your computers if you want to make sure that other people on the network don't send you unwanted view sync messages.

If you're just using Google Earth normally, without using the Liquid Galaxy features described on this site, don't worry.  All the features we talk about here are turned off by default.

# View Synchronization and the monotonic counter bug #

Liquid Galaxy works by sending view synchronization messages over the network.  The messages are sent as UDP datagrams that describe where you are in Google Earth and where you're looking.

In Google Earth 5.2, if you enable `ViewSync/receive` as we describe in the QuickStart, Google Earth will accept these messages from any source, so it's important to use a firewall or private network to limit who you can receive view sync messages from.  (We're trying to improve that behavior in future versions of Google Earth).

In particular, there's a message ID field in the view sync messages that's currently used to reject old messages that might arrive out of order.  So someone who can reach the UDP port you set in `ViewSync/port` could send a message with a very high message ID and cause Google Earth to reject future legitimate view sync messages with lower IDs until you re-launch Google Earth.  (Sorry about that.)

Until then, you can work around this bug by limiting who can reach your UDP port with a firewall.  And of course, if you don't need to worry if you're just using Google Earth normally (that is, with `ViewSync/receive` turned off or omitted from your `drivers.ini`).

# query.txt #

Likewise, if you plan to control Google Earth using a TouchScreen via the [query.txt](QueryTxt.md) interface, you'll want to control who can reach the web pages that make up the user interface for the touch screen.

A properly configured firewall can help, as can techniques like setting the web server to only respond to requests from the same computer it's serving from.  Or, you could set up a [.htpasswd](http://httpd.apache.org/docs/2.0/programs/htpasswd.html) file to require people to login before they can reach the touch screen controls.