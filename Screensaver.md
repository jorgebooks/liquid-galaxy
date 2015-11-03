# How to run screensaver on your Liquid Galaxy #
We'll show you an easy way to update viewport periodically/automatically with simple scripts. All of items should be done on the master machine.

It may make your Liquid Galaxy more fun as a dynamic decoration :)

# Enable QueryTxt on your Liquid Galaxy #
The script uses query.txt to control Google Earth.
Please read [syntax of the query.txt](QueryTxt.md) and put it at /tmp/query.txt.

# Setting up a queries list #
Set up a queries.txt at your working directory.
You can find an example of it at [our svn repository](http://code.google.com/p/liquid-galaxy/source/browse/trunk/php-interface/queries.txt).

# Running the script! #
In our [git repository](http://code.google.com/p/liquid-galaxy/source/checkout), you'll find screensaver.py and tour.sh at [bin directory](http://code.google.com/p/liquid-galaxy/source/browse/#svn/trunk/gnu_linux/home/lg/bin).

If everything is fine, you can start the screensaver with:
```
./screensaver.py './tour.sh ./queries.txt'
```

# Trouble shooting #
Above command doesn't work? Please make sure following things.

## SpaceNavigator is not connected ##
If you don't use [SpaceNavigator](LinuxSpaceNavigator.md) you have to modify screensaver.py a little to support mouse.
Please replace "/dev/input/spacenavigator" with "/dev/input/mice"

## Query text is enabled ##
```
echo 'search=Tokyo' > /tmp/query.txt
```
It will query 'Tokyo' soon. If not, please read the way to [enable query.txt](QueryTxt.md).

## tour.sh can work separately ##
```
./tour.sh ./queries.txt
```
This command selects a query from queries.txt randomly and sends it.
If it doesn't work, please make sure the existence of queries.txt.