//
//  GFUnityDelegate.h
//  GameFeatKit
//
//  Created by K.Yusa on 13/04/12.
//  Copyright (c) 2013年 Basicinc.jp. All rights reserved.
//

#import "GameFeatKit/GFView.h"
#import "GameFeatKit/GFController.h"

@interface GFUnityDelegate : NSObject<GFViewDelegate>

// callback gameobject name
@property (nonatomic, retain) NSString* objectName;

// call appliocation enter background notification
- (void)applicationWillEnterForeground;

// call appliocation will enter foreground notification
- (void)applicationDidEnterBackground;

@end
