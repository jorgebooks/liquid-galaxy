# Introduction #

Earth Tours sometimes require multiple similar images. For instance, a tour covering multiple placemarks might pop up an informational overlay for each placemark. This can be done, of course, in HTML, but that requires a Balloon, and isn't as flexible or provably static as images. The method described creates a set of files based on a template, and renders those files to images.

# Details #

There are all kinds of ways to use text to describe images comprehensively. For our purposes, we'll use SVG and HTML. In each case, we create a sample file, replace key parts of that file with placeholders, fill in those placeholders with information from a data set to create many similar files, and then render those files to raster images.

## Create a Template ##

Since we often build tours with Kamelopard, which is written in Ruby, we find it convenient to use Ruby's templating language, [ERB](http://ruby-doc.org/stdlib-1.9.3/libdoc/erb/rdoc/ERB.html). Like most other templating languages, ERB expects to find special tags within an input text file, and it will replace them with something else. HTML is simple enough to create by hand, or with a builder tool of the author's choice. For SVG, we've used Inkscape, setting text fields in our sample image to something recognizable so it's easy to find them in the resulting SVG file, when we modify the SVG to insert the template tags. For instance, we might create a text box containing the phrase "Title here", and we can search for that text in the SVG result to replace it with an ERB tag.

### Choosing between SVG and HTML ###

It's probably easier for someone who's not an HTML expert to make visually interesting images from scratch with Inkscape; therefore SVG is often a good choice for creating this sort of image. However, so far as we've found, SVG doesn't have a nice system for wrapping large amounts of text, or resizing areas in a way that's aesthetically pleasing, so SVG templates should probably be used only when the text values to be included are approximately the same size. It's probably easier to load external, non-text content dynamically using HTML, so particularly complex images or those with widely varying amounts of text should probably use HTML. Finally, wkhtmltoimage may not be as widely available as inkscape, for doing the final rendering. Your mileage may vary.

## Process the Template ##

Ruby scripts to handle ERB are fairly common on the internet; here's a minimal example from a script to create an image for each employee in a data set:

```
require 'rubygems'
require 'erb'
require 'yaml'
 
templ = IO.read 'employee.svg.erb'
svg = ERB.new templ
 
employees = YAML::load_file 'employeedata.yml'
employees.each do |e|
    pngfile = "images/#{e['short']}.png"
    svgfile = "images/#{e['short']}.svg"

    next if test ?f, pngfile
    employee_name = e['name']
    title = e['title']
    year = e['hire_date']
    location = "#{e['city']}, #{e['state']}"

    File.open(svgfile, 'w') do |f| f.write svg.result(binding) end
    inkscape_cmd = "inkscape -i main_group -e #{pngfile} #{svgfile}"
    system inkscape_cmd
    File.unlink svgfile
end
```

This will load the template file, load the data set, and loop through the data set. For each record, it uses the template to create an SVG file, and then uses Inkscape's batch mode to render it.

### SVG Caveat ###

The inkscape batch command requires the name of an SVG group to render. This is the 

&lt;g&gt;

 tag in SVG, and you need to know what ID value to feed the command. The easiest thing is to find the first 

&lt;g&gt;

 element in the SVG file, and change its ID to something you know, like "main\_group" as in the code above. This will render the entire image. Should you want to render a smaller part of the image, you'll need to choose the ID for a smaller section.

## Rendering Files ##

### SVG ###

Inkscape's batch mode is as follows:

```
inkscape -i group_id -e output_file input_file
```

The group\_id is the ID value mentioned under "SVG Caveat", above; the other inputs are self-explanatory.

### HTML ###

There may be many projects available for rendering HTML to images; we've used wkhtmltoimage, part of the WebKit project. For Fedora boxes, it's in the RPM Sphere repository; Ubuntu may have it as part of the main repo. Run it like this:

```
wkhtmltoimage input_file output_file
```

It should deduce the proper format with the output file's extension; if not, the -f option may help.