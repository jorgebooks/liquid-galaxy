Multi-axis devices like the 3Dconnexion SpaceNavigator are supported natively by Linux.  Device files show up as files like /dev/input/event1, and when the device sends out an event, you can read it from the appropriate event file as an input\_event struct.

We've [checked in](https://code.google.com/p/liquid-galaxy/source/browse/#git%2Finput_event) some example C code that shows how to read these events, and how to create them.

Creating a "synthetic" event lets you write code that simulates a user using a multi-axis device.  If you use mkfifo to create a named pipe, you can point Google Earth for Linux at that pipe using the LinuxSpaceNavigator instructions.  Then write your synthesized events to the pipe and Earth will behave just as if those events came from a multi-axis device.

That opens up possibilities for controlling Earth in unusual ways, such as from a treadmill or with sensors connected to a microcontroller.