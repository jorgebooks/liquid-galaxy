# Introduction #

ClusterGL is a system to transparently intercept OpenGL API calls and spread them over multiple machines. This means that it isn't necessary to write applications specifically to run over multiple machines.

I developed it originally to run on the [Symphony Cluster](http://symphony.waikato.ac.nz) display wall at my university, and it's now being adapted to run on Liquid Galaxy hardware.

![http://bieh.net/~paul/lgwiki/openarena.jpg](http://bieh.net/~paul/lgwiki/openarena.jpg)

Above: Running unmodified [OpenArena](http://www.openarena.ws/OpenArena) on our wall under ClusterGL. There's five display nodes, one for each column of screens. Total resolution is 8400x4200, although it's run at a virtual 8880x4560 to allow for bezels.

# Comparison to Chromium #

Conceptually CGLs aims are similar to the [Chromium](http://chromium.sourceforge.net/) parallel rendering system.

The differences:
  * Efficiency. We have gone to some length to optimise the process - on the above OpenArena test, CGL is approximately 3x faster than Chromium on the same hardware.

  * Modernity. Unfortunately, Chromium development has slowed. CGL implements a larger amount of newer graphical features, letting more advanced applications run.

Check out the paper linked below for details.

# Technical Information #

We presented ClusterGL at Eurographics 2011.
  * Paper: [Distributed OpenGL Rendering in Network Bandwidth Constrained Environments](http://bieh.net/~paul/lgwiki/clusterGL.pdf)

  * [Slides from the conference](http://bieh.net/~paul/lgwiki/clustergl_eurographics.pdf)

# Current status #

Check out the Google Code page: http://code.google.com/p/clustergl2/

# Snapshots of ClusterGL running at UWS - from Andrew #

We have a prototype Liquid Galaxy rig at UWS, called the Wonderama, which we've been using to run up & test Paul's code. Below are some snaps of the progression over the course of the project _(Andrew, Paul's GSoC Mentor)._

### 16 July 2011 ###
<img src='https://lh5.googleusercontent.com/-63i9wFZjxsk/TiFFieCGhKI/AAAAAAAABUU/oNM7Xjo3byg/h301/Screenshot.jpg'>

<h3>29 July 2011</h3>
<img src='https://lh5.googleusercontent.com/-TuMVxFDV8RY/TjJ27t6sX-I/AAAAAAAABYM/8c47FtDjyfU/h301/IMG00170.jpg'>

<h3>13 August 2011</h3>
<img src='https://lh3.googleusercontent.com/-Ov6B8LcZbE4/TkYZLh2o9iI/AAAAAAAABZQ/VTlf8fM1Aug/s288/LG-CubeRow1.jpg'>
<img src='https://lh6.googleusercontent.com/-TfFH-ia6YuM/TkYZO123xBI/AAAAAAAABZU/qKAqd7fzmIo/s288/LG-CubeRow2.jpg'>