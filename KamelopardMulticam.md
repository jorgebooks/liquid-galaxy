# Introduction #

Liquid Galaxies are, of course, designed for simulating panoramic images using several screens, each offset by a calculated amount. In a Liquid Galaxy, Google Earth does this calculation for you. But in cases where you can't use a Liquid Galaxy, such as if you're trying to create panoramic videos with Google Earth's Movie Maker feature, you can use Kamelopard's Multicam module to do the calculations.

# Details #

Multicam is built around the idea of one main camera, with other cameras to the left and/or right. Although Multicam doesn't need to know this camera's latitude, longitude, or altitude, its orientation in terms of heading, tilt, and roll are important. Multicam also needs to know the view angle for these cameras, which can be specified directly, or inferred from a user-specified number of cameras, taken with the assumption that these cameras cover the full 360 degree circle. Cameras are numbered sequentially. The main camera is 0; positive numbers indicate cameras to the right, and negative numbers are for cameras to the left.

Multicam has only one user-facing API call, get\_camera(). It accepts the main camera's heading, tilt, and roll as its first three arguments, followed by the camera number, the field of view in degrees for each camera, and the total number of cameras. Only one of these last two arguments should be specified; the field of view will be interpolated based on the number of cameras, if only the number of cameras is given. get\_camera() returns three values: the heading, tilt, and roll calculated for the particular camera.

Here's a simple example, where "view" contains a Camera object for Camera 0's view:

```
  (-5..5).each do |camera|
    (h, t, r) = Kamelopard::Multicam.get_camera(view.heading, view.tilt,
                                                view.roll, camera, nil, 11)
    view.heading = h                                                
    view.tilt = t                                                   
    view.roll = r                                                   
    fly_to view, :duration => dur*1.0/num_points, :mode => :smooth  
  end
```

This creates each camera view in turn, and flies to it. Not particularly useful, perhaps, but it demonstrates the API well enough.