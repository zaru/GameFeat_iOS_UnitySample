//
//  GFUnityDelegate
//  GameFeat
//
//  Created by K.Yusa on 13/04/12.
//  Copyright (c) 2013年 Basicinc.jp. All rights reserved.
//

#import "GFUnityDelegate.h"

extern void UnitySendMessage(const char* obj, const char* method, const char* msg);

@implementation GFUnityDelegate

@synthesize objectName;

#pragma mark -
#pragma mark callback
// callback GF start.
- (void)didShowGameFeat {
    NSLog(@"#didShowGameFeat");
    const char* objName = [self.objectName UTF8String];
    UnitySendMessage(objName, "didShowGameFeat", "");
}

// callback GF close.
- (void)didCloseGameFeat {
    NSLog(@"#didCloseGameFeat");
    const char* objName = [self.objectName UTF8String];
    UnitySendMessage(objName, "didCloseGameFeat", "");
}

// call appliocation enter background notification
- (void)applicationDidEnterBackground {
    NSLog(@"#applicationDidEnterBackground");
    UIDevice *device = [UIDevice currentDevice];
    BOOL backgroundSupported = NO;
    if ([device respondsToSelector:@selector(isMultitaskingSupported)]) {
        backgroundSupported = device.multitaskingSupported;
    }
    if (backgroundSupported) {
        [GFController backgroundTask];
    }
}

// call appliocation will enter foreground notification
- (void)applicationWillEnterForeground {
    NSLog(@"#applicationWillEnterForeground");
    [GFController conversionCheckStop];
}

@end
