# Extra tweaks for Linux/X11 display nodes #

These extra tweaks might be of value.
Note: these are submitted from users on the liquid-galaxy mailing list and are not part of the standard Google Liquid Galaxy setup.

## Hiding the Google Earth top-menu bar for a proper fullscreen mode ##

### Using devlispie ###

[Devilspie](http://burtonini.com/blog/computers/devilspie/) is a daemon that can be used to 'tweak' window placement on the X11 desktop. It should be available to install with your Linux distribution.

Devilspie reads it's configuration from files placed in the directory ~/.devilspie/

You will want to create a Google Earth window which is slightly taller than your screen height and placed just off the top edge. To find the resolution of your screen use `xdpyinfo`.

In a perfect world we would just make the window about 25 pixels taller and then offset the window -25 pixels, unfortunately you will probably need to use some trial-and-error to find out which vertical size and vertical offset works for you!

As an example, this config worked on a display which is 1680x1050, saved as `~/.devilspie/googleearth.ds`

```
(if
 (is (window_name) "Google Earth")
 (begin
  (geometry "1680x1071+0-1")
  (undecorate)
 )
)
```

|<img src='http://lh3.ggpht.com/_jn_v5gODYp0/TTZ1IiNeaEI/AAAAAAAABGA/sdpjr7QL-7Y/LG-linux-fullscreen.jpg' /><br>Caption: MacBook Pro with Fedora Linux, Google Earth and Devilspie</tbody></table>

Once you have a config that works you can run <code>devilspie &amp;</code> from your normal X11 startup scripts (typically <code>.xinitrc</code> or <code>.xsession</code>).<br>
<br>
You can still access the Google Earth menu options by using the keyboard shortcuts. eg. Alt-F. Although, as most slave display nodes will be keyboard-less this may never be needed.<br>
<br>
<h3>Using wmctl ###

The app 'wmctl' can also be used to move windows _(need to add more here - Alf)_

## Making the X11 mouse pointer invisible ##

On slave displays one way to make the X11 mouse cursor invisible is with the program "unclutter". This is probably also in your Linux distro. This forces the mouse pointer to become transparent after a few seconds. The pointer becomes visible as soon as you move the mouse. Place `unclutter&` in your `.xinitrc` or `.xsession` startup script.