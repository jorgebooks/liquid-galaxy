# Introduction #

Given Kamelopard's [multiple camera](KamelopardMulticam.md) and [mathematical function](KamelopardFunctions.md) support, it's possible to use Google Earth to pre-render tours as video, which can be replayed on a Liquid Galaxy. This can be useful for many things, including dealing with slow internet connections and working around problems with inconsistent viewsyncrelay actions.

# Object #

The principle object in doing this sort of thing is to allow us to pre-render tours as videos, for replay on a Liquid Galaxy in situations where we want to be able to modify the video beforehand, control timing more closely, deal with poor internet connections, or other such things. In such cases we need to be able to calculate exactly where the camera should be at any moment, for not only the central display but all the other displays as well. These are offset from the central display in certain ways; those calculations are handled by Kamelopard's [multiple camera](KamelopardMulticam.md) functions.

Since gx:FlyTo behavior in bounce mode isn't always the exactly repeatable, and just because it sometimes doesn't do exactly what we want, we also need to be able to replicate it. We do this with [mathematical function](KamelopardFunctions.md) support, and a function called bounce(a, b, p, opt), which takes two AbstractViews a and b, and calculates a bounced flight path between them. Here's an example:

```
num_points = 10

TourPoints = [
        :name=>"Descriptive name here",
        :latitude => 37.68194758529572,
        :longitude => -95.45175121897775,
        :altitude => 11879234.16373027116060,
        :heading => 0.0,
        :tilt => 0.0,
        :roll => 0.0,
        :flytodur => 2,
        :tilt => 0,
        :pause => 10,
    },
# ... More points are defined here.
]

(-5..5).each do |camera|
    Kamelopard::Tour.new("Camera #{camera}")
    lv = nil
    TourPoints.each do |tp|
        dur = tp[:flytodur]
        dur = 10 if dur.nil?
        v = make_view_from(tp)

        if not lv.nil? then
            (va, pa) = bounce(lv, v, dur, num_points, :no_flyto => 1) unless lv.nil?
            va.each do |view|
                (h, t, r) = Kamelopard::Multicam.get_camera(view.heading, view.tilt, view.roll, camera, nil, 11)
                view.heading = h
                view.tilt = t
                view.roll = r
                fly_to view, :duration => dur*1.0/num_points, :mode => :smooth
            end
            pause tp[:pause] if tp.has_key? :pause
        end
        lv = v
    end
end

write_kml_to 'doc.kml'
```

This script creates 11 tours, one for each camera in the panoramic view. For each tour, it iterates through a series of tour points. For each two points, it calculates a path between them, and then for each point on that path, it gets the proper heading for the camera it's working on currently. Finally, it flies to the resulting point.

Having created the tours, each can be rendered into a video and processed as desired.