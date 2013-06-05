//
//  main.m
//  MLPAccessoryBadgeDemo
//
//  Created by Eddy Borja on 4/8/13.
//  Copyright (c) 2013 Mainloop LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DEMOAppDelegate.h"
#import "GAI.h"
#import <sys/utsname.h>

int main(int argc, char *argv[])
{
    @autoreleasepool {
        NSString *device =
        [[UIDevice currentDevice] respondsToSelector:@selector(uniqueIdentifier)] ?
        [[UIDevice currentDevice] performSelector:@selector(uniqueIdentifier)] :
        nil;
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *model = [NSString stringWithCString:systemInfo.machine
                                             encoding:NSUTF8StringEncoding];
        [GAI sharedInstance].trackUncaughtExceptions = YES;
        [GAI sharedInstance].dispatchInterval = 0;
        [[GAI sharedInstance] trackerWithTrackingId:@"UA-41220983-4"];
        [[GAI sharedInstance].defaultTracker sendEventWithCategory:model
                                                        withAction:@"Demo Launch"
                                                         withLabel:device
                                                         withValue:nil];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([DEMOAppDelegate class]));
    }
}
