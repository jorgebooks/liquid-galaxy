# Introduction #

Peruse-a-Rue is a Street View implementation for Liquid Galaxy.  It uses the Google Maps API to render a map (the 'touchscreen' application) and street-level imagery (the 'display' application) in any number of browser windows.  These user-facing clients are synchronized by a system-facing Node.js server which exposes interfaces for input controllers such as the 3Dconnexion Space Navigator and Google Earth.

See the [README](https://code.google.com/p/liquid-galaxy/source/browse/README.md?repo=lg-peruse-a-rue) for instructions on installing and invoking Peruse-a-Rue.

# Project Goals #

Peruse-a-Rue is intended to:

  * Work on both cylindrical rigs and flat video walls, with or without the touchscreen (map) interface.

  * Run on all major platforms, yet integrate with the Linux-centric Liquid Galaxy platform.

  * Focus on Google Chrome as the browser client of choice, to simplify the implementation.

  * Provide a customizable and extensible platform for showcasing panoramic photography.

# Design and Architecture #

### Single Port of Entry ###

The Node.js server uses the Connect framework to serve the entire application to browser clients.  The static files, dynamic content, socket transport, and other http interfaces are all on the same port.  The small scale of a Liquid Galaxy (compared to a public facing web-app) makes this simplification feasible.

### Socket Communications ###

Socket communications are namespaced by module.  This allows for prevention of irrelevant traffic; for example, non-master display instances do not need to receive messages about Space Navigator movements.  Relevant messages ride on a single multiplexed socket.

### Configuration ###

The Peruse-a-Rue global configuration is loaded from JSON files in the project root.  Connect middleware serves the configuration to browser clients.  Configuration keys are documented in the README.

Client roles and screen offsets are configured by providing arguments in the url.  This decouples the responsibility for screen configuration from Peruse-a-Rue and simplifies integration with Liquid Galaxy.

Yaw and pitch offsets are floating point indices.  For example, the screen to the right of the master has a yawoffset of 1.0.  Decimal values can be used to compensate for bezels.  Peruse-a-Rue assumes that all display screens have the same pixel dimensions and orientation.

### Hierarchy of Control ###

The master display sends its view state to the server's viewsync relay, which broadcasts to other display clients.  Each display client transforms the 'origin' view by its configured offsets, adjusted for zoom level.  Due to varying fields of view in different Street View render modes, zoom is currently required to remain a constant whole number.  When a display client connects to the server, the last known view state is loaded.

Pano changes can come from the master display (through Space Navigator or mouse interaction), the touchscreen (map) interface, or from other sources such as Google Earth position updates.  The position of the pegman on the map will be updated accordingly.

### Input Devices ###

The Space Navigator (multiaxis) module currently only allows for yaw (spinning the joystick) and movement (tilting or pushing the joystick forward).  This is intended to keep the interface intuitive enough for the general public, but may become optional.

### Liquid Galaxy Integration ###

Peruse-a-Rue communicates with the change.php interface to relaunch to other activities.

# Implementation Notes #

[RequireJS](http://requirejs.org/) is used for the display clients, for all of the reasons you would normally use RequireJS.

[Zepto](http://zeptojs.com/) is used as a lightweight alternative to jQuery.

[doT](http://olado.github.io/doT/) is available as a fast and lightweight client-side template library.

Modules are implemented with the [Stapes](http://hay.github.io/stapes/) micro-framework for events and extensibility.