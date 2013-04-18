//
//  GFUnityPlugin.h
//  GameFeatKit
//
//  Created by K.Yusa on 13/04/12.
//  Copyright (c) 2013”N Basicinc.jp. All rights reserved.
//

#import "GameFeatKit/GFView.h"
#import "GameFeatKit/GFController.h"
#import "GFUnityDelegate.h"

extern UIViewController* UnityGetGLViewController();

extern "C" {
    void start_(const char* siteId);
    void startWtCallback_(const char* siteId, const char* objName);
    BOOL conversionCheck_();
    void show_(const char* siteId);
    void showWtCallback_(const char* siteId, const char* objName);
    void backgroundTask_();
    void conversionCheckStop_();
    NSString* charToString(const char*);
    UIViewController* getUnityViewController();
    void setApplicationNotification(GFUnityDelegate* callback);
}

#pragma mark -
#pragma mark GFView
// GFView.start
void start_(const char* siteId) {
    NSLog(@"#start_");
    NSString* strSiteId = charToString(siteId);
    GFUnityDelegate* callback = [[GFUnityDelegate alloc] init];
    setApplicationNotification(callback);
    UIViewController* parent = getUnityViewController();
    [[GFView alloc] start:parent site_id:strSiteId];
}

// GFView.start delegate
void startWtCallback_(const char* siteId, const char* objName) {
    NSLog(@"#start_del");
    NSString* strSiteId = charToString(siteId);
    GFUnityDelegate* callback = [[GFUnityDelegate alloc] init];
    setApplicationNotification(callback);
    UIViewController* parent = getUnityViewController();
    NSString* strObjName = charToString(objName);
    [callback setObjectName:strObjName];
    [[GFView alloc] start:parent site_id:strSiteId delegate: callback];
}

// GFView.conversionCheck
BOOL conversionCheck_() {
    NSLog(@"#conversionCheckStop");
    return [[GFView alloc] conversionCheck];
}

#pragma mark -
#pragma mark GFController
// GFController.showGF
void show_(const char* siteId) {
    NSLog(@"#showGF");
    NSString* strSiteId = charToString(siteId);
    UIViewController* vc = getUnityViewController();
    [GFController showGF:vc site_id:strSiteId];
}

// GFController.showGF delegate
void showWtCallback_(const char* siteId, const char* objName) {
    NSLog(@"#showGF_del");
    NSString* strSiteId = charToString(siteId);
    UIViewController* vc = getUnityViewController();
    GFUnityDelegate* callback = [[GFUnityDelegate alloc] init];
    NSString* strObjName = charToString(objName);
    [callback setObjectName:strObjName];
    [GFController showGF:vc site_id:strSiteId delegate:callback];
}

// GFController.backgroundTask
void backgroundTask_() {
    NSLog(@"#backgroundTask");
    [GFController backgroundTask];
}

// GFController.conversionCheckStop
void conversionCheckStop_() {
    NSLog(@"#conversionCheckStop");
    [GFController conversionCheckStop];
}

#pragma mark -
#pragma mark private
// privae
NSString* charToString(const char* c) {
    return [NSString stringWithCString:c encoding:NSUTF8StringEncoding];
}

// privae
UIViewController* getUnityViewController() {
    return UnityGetGLViewController();
}

// private
void setApplicationNotification(GFUnityDelegate* callback) {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:callback selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [nc addObserver:callback selector:@selector(applicationWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
}
