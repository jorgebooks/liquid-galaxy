# ViewSync to KML NetworkLink #

Here's an interesting thing you can do with those great ViewSync packets.

  1. Requires a machine which can receive/listen for the ViewSync packets from your Liquid Galaxy which also has web server.
  1. ViewSync logger script which simply writes the last received packet info (lat, long, etc) to a temporary file.
  1. A CGI script which reads that file and generates KML, referencing a model file.
  1. A starter KML to load into Google Earth.


## viewsynclogger.pl ##

This listens for ViewSync packets and simply logs them to a file. The machine running this must either be in same broadcast domain as Liquid Galaxy rig or the ViewSync packets are explicitly directed to this host eg. ViewSync/hostname=this\_host.

```
#!/usr/bin/perl -w
# GoogleEarth ViewSync packet logger
#
# 20110220 Andrew Leahy a.leahy@uws.edu.au alfski@gmail.com
# bastardised version of earlier code

use strict;
use IO::Socket;
use Getopt::Long;

my $IN_PORT = 21568;
my $MAXLEN = 256;
my $JUST_LISTEN = 1;
my $VERBOSE = 0;

GetOptions('inport=i' => \$IN_PORT, 'verbose!' => \$VERBOSE, 'listen!' => \$JUST_LISTEN );

my ($recv);

if ($JUST_LISTEN) { $VERBOSE = 1; };

$recv = IO::Socket::INET->new( LocalPort => $IN_PORT, Proto => 'udp') or die "recv socket: $@";

print "Listening for UDP ViewSync messages on port $IN_PORT\n" if $VERBOSE;

my ($recv_msg, $viewmaster_inet, $viewmaster_port);

my $LOG;
open (LOG, '>/tmp/viewsync.log');
$| = 1;

while ($recv->recv($recv_msg, $MAXLEN)) {

 if (!$viewmaster_inet) {
  ($viewmaster_port, $viewmaster_inet) = sockaddr_in($recv->peername);
  print "Found View Master on " . inet_ntoa($viewmaster_inet) . "\n" if $VERBOSE;
 }

 if ($JUST_LISTEN) {
  #print "$recv_msg\n" if $VERBOSE;
  my @viewsync = split(',', $recv_msg);
  #print "lat=$viewsync[1],long=$viewsync[2],alt=$viewsync[3],heading=$viewsync[4],tilt=$viewsync[5]\n";
  seek LOG, 0, 0;
  print LOG "$viewsync[1]\n$viewsync[2]\n$viewsync[3]\n$viewsync[4]\n$viewsync[5]\n";
 }

}
die "$0: $!";
```

This script simply delivers the ViewSync lat, long, altitude, heading, tilt to a newline delimited file /tmp/viewsync.log. It looks something like -

```
35.35246521802293
138.72749722488484
3699.58933145439232
16.79579057415190
89.95205760650694
```

## Web CGI to read ViewSync log and generate KML ##

This CGI Python script reads ViewSync log file from the script above and generates KML. Place this on the machine logging the ViewSync packets, in a place where the webserver can run it. For example, I called this script "arrow.cgi" and access it as http://137.154.23.173/arrow.cgi (this link won't work for you!).

Also, please modify the model\_url to something more local. It is accessible to everyone, so just download it and place it closer to you.

Because of the way the specific arrow model is aligned I have to modify the heading and tilt. For a different model you may need to adjust those offsets.

```
#!/usr/bin/python
# Alf 20100513
# read viewsync.log and generate networklink KML
# based on Google sample KML python scripts

import os.path

logfile = '/tmp/viewsync.log'

if os.path.exists( logfile ):

 model_url = 'http://marcs.uws.edu.au/files/arrow.dae'
 f = open( logfile, 'r')
 latitude = f.readline().strip()
 longitude = f.readline().strip()
 altitude = f.readline().strip()
 heading = float(f.readline().strip()) - 90
 tilt = float(f.readline().strip()) - 90
 f.close()
 model_scale = abs(float(altitude) / 50)

 kml = (
  '<Placemark>\n'
  '<name>Arrow Model</name>\n'
  '<Style id="default"/>\n'
  '<Model>\n'
  '<altitudeMode>absolute</altitudeMode>\n'
  '<Location>\n'
  '<latitude>%s</latitude>\n'
  '<longitude>%s</longitude>\n'
  '<altitude>%s</altitude>\n'
  '</Location>\n'
  '<Orientation>\n'
  '<heading>%s</heading>\n'
  '<tilt>0</tilt>\n'
  '<roll>%s</roll>\n'
  '</Orientation>\n'
  '<Scale>\n'
  '<x>%s</x>\n'
  '<y>%s</y>\n'
  '<z>%s</z>\n'
  '</Scale>\n'
  '<Link>\n'
  '<href>%s</href>\n'
  '</Link>\n'
  '</Model>\n'
  '</Placemark>'
 ) %( latitude, longitude, altitude, heading, tilt, model_scale, model_scale, model_scale, model_url )
else:
 kml = ''

print 'Content-Type: application/vnd.google-earth.kml+xml\n'
print '<?xml version="1.0" encoding="UTF-8"?>'
print '<kml xmlns="http://www.opengis.net/kml/2.2">'
print kml
print '</kml>'
```

## Starter KML ##

Save the KML below (say as arrow.kml). Modify the href to wherever you've placed the above CGI script. The link used here won't work for you! And then load the KML into Google Earth.

```
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
 <Folder>
  <name>Arrow NetworkLink</name>
  <NetworkLink>
   <name>Arrow feeder</name>
   <flyToView>0</flyToView>
   <Link>
    <href>http://137.154.23.173/arrow.cgi</href>
    <refreshMode>onInterval</refreshMode>
    <refreshInterval>1</refreshInterval>
   </Link>
  </NetworkLink>
 </Folder>
</kml>
```

_**Enjoy!**_

Example: The orange arrow in Google Earth Client is showing the position and view heading of the GE Plugin as it hovers over Mt Fuji, Japan.

<img src='http://lh3.googleusercontent.com/_jn_v5gODYp0/TctdpSs6XfI/AAAAAAAABPc/ldHQu2ps4a4/s720/LG-plugin-arrow.jpg'>