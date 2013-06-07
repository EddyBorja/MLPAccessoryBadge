MLPAccessoryBadge
=================

>"When you have a big table of cells, it helps to have navigation cues that can give you some idea about what you should expect if you were to select a _UITableViewCell_. A lot of apps use these little badges in a cell's accessory view that contain numbers or text to provide these kind of hints, but there's no simple way to make these... until now. Presenting _MLPAccessoryBadge_!"

![Alt text](/badgeDemo.png "Screenshot")

About
---------
_MLPAccessoryBadge_ is a delightfully customizable UIView subclass that renders text inside a badge, created mainly for use in a _UITableViewCell_ as its `accessoryView` property. Use it to hint at quantities, states, notifications, urgency, etc...

An _MLPAccessoryBadge_ is not restricted solely for use in a _UITableViewCell_, it was just designed with that use case in mind. Feel free to find other creative uses for the accessory badge!

_MLPAccessoryBadge_ requires no graphic files to work, all drawing happens natively. This means you can customize colors, shading and shapes with ease!


Usage
---------

1. Add the _MLPAccessoryBadge.h_ and _MLPAccessoryBadge.m_ files to your project.

2. Make sure you have Apple's QuartzCore framework added to your project, _MLPAccessoryBadge_ needs it for drawing routines.

3. Now it's time to create your badge. Assuming `cell` is a _UITableViewCell_ for your _UITableView_, the following code creates a simple gray badge as the accessory view of your cell:

`MLPAccessoryBadge *accessoryBadge = [MLPAccessoryBadge new];`

`[accessoryBadge setText:@"Hello World"];`

`[cell setAccessoryView:accessoryBadge];`

Check the header file of _MLPAccessoryBadge_ to find more customization options.


Cocoapods
-------
CocoaPods are the best way to manage library dependencies in Objective-C projects.
Learn more at http://cocoapods.org

Add this to your podfile to add the MLPAccessoryBadge to your project:<br /> `pod 'MLPAccessoryBadge', '~> 0.9'`


What to Expect in Future Updates
-----------

+ More customization options

+ The ability to insert images into badges.


License
--------
_MLPAccessoryBadge_ uses the MIT License:

>Copyright (c) 2013, Mainloop LLC

>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Credits
---------

_MLPAccessoryBadge_ was written by Eddy Borja, at Mainloop LLC.

If you make use of _MLPAccessoryBadge_, tell us about it! 
Reach us at hello@mainloop.us
:D

More Stuff
---------
Be sure to check out these other libraries:

[MLPSpotlight](https://github.com/EddyBorja/MLPSpotlight)<br />
[MLPAutoCompleteTextField](https://github.com/EddyBorja/MLPAutoCompleteTextField)<br />
[UIColor+MLPFlatColors](https://github.com/EddyBorja/UIColor-MLPFlatColors)<br />

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/ca16269bd8cf274377a6846c4221fdb7 "githalytics.com")](http://githalytics.com/EddyBorja/MLPAccessoryBadge)
