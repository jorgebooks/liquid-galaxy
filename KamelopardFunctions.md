# Introduction #

Most of the time, telling Earth to fly from one point to another with a KML gx:FlyTo element is sufficient for a decent presentation. Sometimes, however, it proves unsatisfactory. For instance, it might move too fast, or too high, or vary in its exact path too much between runs of the tour. Kamelopard's mathematical function modeling allows you to simulate gx:FlyTo's behavior in a more controllable fashion. Using Kamelopard::Functions, you can model mathematical functions of various sorts, and use them to control motion through space or time as well as camera orientation.

# Details #

We'll start with example code using these functions:

```
require 'rubygems'
require 'kamelopard'

include Kamelopard
include Kamelopard::Functions

make_function_path(10,
    :latitude => Line.interpolate(38.8, 40.3),
    :longitude => Cubic.interpolate(-112.4, -111.9, -0.5, -113, 0.5, -110),
    :altitude => Line.interpolate(10000, 2000),
    :heading => Line.interpolate(0, 90),
    :tilt => Line.interpolate(40.0, 90),
    :altitudeMode => :absolute,
    #:extrude => 1,
    #:roll => 0,
    :show_placemarks => 1,
    :duration => Quadratic.interpolate(2.0, 4.0, 0.0, 1.0),
) do |a, v|
    if v.has_key? :callback_value then
        v[:callback_value] += 1
    else
        v[:pause] = 0.01
        v[:callback_value] = 1
    end
    v
end

name_document 'Functions test'
name_folder 'Placemarks'
name_tour 'Function test'

write_kml_to 'doc.kml'
```

This function creates a KML file with a gx:Tour inside, which flies a smooth path from one point to another. This path is calculated by Kamelopard, not Google Earth. The function make\_function\_path() generates this flight as a series of smooth gx:FlyTo movements through a series of way points. This function calculates a series of AbstractView objects, and returns them as well as placemarks made from them, to the caller. It can also add the placemarks to a KML document, and/or build a tour from the views.

make\_function\_path() takes two arguments and an optional block. The first argument is an integer number of total views to create. This value should probably be greater than 2: one for each endpoint, plus way points in the middle. The second argument is a hash, described in the gem documentation, available [here](https://rubygems.org/gems/kamelopard). Elements of the hash include anything accepted by the make\_view\_from() function, as well as a few others to govern whether or not to add the views or placemarks to the KML document.

make\_function\_path works by creating a series of hashes from the arguments it is passed. It sends each has to make\_view\_from() to make an AbstractView, and uses that view as the basis for the path it creates. Hence the relationship between the hash argument to make\_function\_path() and the options make\_view\_from() understands. In this example, the :altitudeMode key of each hash will be constant, but the other hash values are defined by a model of a mathematical function. For instance, :altitude is defined as Line.interpolate(10000, 2000); this creates a model that smoothly and linearly moves from 10000 to 2000. So the beginning of the path will be at an absolute altitude of 10000 meters, and end at 2000 meters. Other functions are available to model quadratic and cubic functions, as shown above. Consult the gem documentation for more details, including the meaning of the arguments to the interpolate() method for each function type.

The optional code block will run once for each hash, just before each view is built. It gets passed an integer, representing the number of the way point being created, and the full hash thus far. It can modify the hash as it pleases. It can also set a :callback\_value key in the hash, which it will be passed as part of the next hash.

## Multidimensional functions ##

The functions discussed thus far all take one argument, and return one value. Kamelopard supports functions that return multiple values, using make\_function\_path's :multidim option. Using this option, you can specify which hash value should receive each of the values a multidimensional function returns. Here's an example, using Kamelopard's Catmull-Rom spline function. Catmull-Rom splines are common in computer graphics, and have the advantages of handling any number of dimensions, as well as passing exactly through each control point:

```
require 'kamelopard'
require 'kamelopard/spline'

include Kamelopard
include Kamelopard::Functions

sp = SplineFunction.new(5)
sp.add_control_point [4,30,30,10000,234], 10
sp.add_control_point [8,40,30,9000,234], 30
sp.add_control_point [8,50,50,8000,234], 60
sp.add_control_point [4,35,50,7000,234], 10

name_document 'Spline test'
name_folder 'Spline resources'
name_tour 'Spline tour'

a = make_function_path(100,
    :altitudeMode => :relativeToGround, :tilt => 45, :show_placemarks => 1,
    :multidim => [ [ sp, [ nil, :latitude, :longitude, :altitude ] ] ]
)

write_kml_to
```

Splines calculate smooth curves between "control points", so these are created first. The various dimensions in the control point can be whatever value the user finds convenient; their order is determined by the argument to make\_function\_path. In this case, after creating the spline, I pass it to make\_function\_path, saying that the first and last of its five result values should be ignored, and the middle three should be assigned to latitude, longitude and altitude respectively. Heading, tilt, and roll are given their default values, zero in each case. So the control points begin with 30 degrees north latitude, 30 degrees east longitude, at 10,000 meters.

The final argument to the add\_control\_point() method is important. It represents the relative "duration" of the segment ended by this control point. The first control point's duration is always ignored. In the example above, the remaining durations total 100, thus the segment of the spline between the first and second control points will account for 30% of the generated way points, the segment between the second and third points will include 60% of the way points, and so on.