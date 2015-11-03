# Introduction #

ViewSync traffic lets a master node in a Google Earth Liquid Galaxy tell the slave nodes what it's looking at. Since Earth can only send this traffic to one location, it's sometimes useful to have something that will forward the traffic to other locations. It's also nice to be able to respond to ViewSync traffic for various purposes. viewsyncrelay will do both. It was written by End Point Corporation.

# Basics #

Several important concepts are central to viewsyncrelay:

  * input streams: These are UDP sockets which receive ViewSync traffic.
  * output streams: These are UDP destinations to which ViewSync traffic will be forwarded
  * transformations: These are an entirely theoretical concept at this point. The idea was to modify ViewSync traffic in flight, but it seems no one has found a sufficiently compelling use case to justify spending the development time
  * linkages: These link input streams to output streams, telling viewsyncrelay how to route traffic
  * control socket: An as yet unimplemented feature where viewsyncrelay listens on a UNIX socket for various control commands
  * actions: These describe shell commands viewsyncrelay should run when the ViewSync traffic meets certain criteria. These are easily the most complicated viewsyncrelay feature

# Configuration #

Configuration is in YAML format, and is documented within the sample viewsyncrelay configuration file, viewsyncrelay-config.yml, [here](http://code.google.com/p/liquid-galaxy/source/browse/gnu_linux/home/lg/bin/viewsyncrelay-config.yml)

# Command line options #

The most up to date command line documentation is available by running the script with the -h argument. This is the current version at the time of this writing.

```
[josh@eddie ~/devel/lg/liquid-galaxy/gnu_linux/home/lg/bin]$ ./viewsyncrelay.pl -h

NAME
    viewsyncrelay.pl

SYNOPSIS
    viewsyncrelay.pl [OPTIONS] config_file
    viewsyncrelay.pl --help

DESCRIPTION
    viewsyncrelay accepts Google Earth ViewSync packets as input and,
    optionally, forwards them to one or more destinations, potentially
    transforming them in the process. It is also capable of checking ViewSync
    packets against sets of conditions and starting various actions when the
    conditions are met.

    viewsyncrelay takes a YAML config file to tell it what to do. See the
    sample config file for an idea of how to use it. It is possible to specify
    multiple config files, or a directory in which all valid YAML files will be
    considered config files.

OPTIONS
    --vi, --vo, --vl, --va, --vt
        Increase verbosity for input streams, output streams, linkages,
        actions, and transforms respectively. Each option can be given more
        than once.

    --sva=NAME
        Make action NAME *very* verbose, without getting spam from all the
        other actions

    -f /path/to/fifo, --fifo=/path/to/fifo
        Open (optionally creating first) a FIFO at /path/to/fifo (relative
        paths are acceptable as well) for control commands. This can also be
        specified in the configuration file(s), but the command-line option
        will override the config file. Further documentation is provided in the
        sample config.yml.

    -v, --verbose
        Setting this option once is equivalent to setting --vi, --vo, --vl,
        --va, and --vt. This can be set multiple times

    --kml[=URL]
        Download list of KMLs from a URL (default: http://lg-head/kmls.txt),
        expecting to find a list of KML files therein. It will then download
        each of those KML files, extract actions.yml from each if it exists,
        and use those to configure itself.

    -h, --help
        Print this help
```