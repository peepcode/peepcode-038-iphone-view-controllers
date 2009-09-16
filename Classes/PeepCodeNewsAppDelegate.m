//
//  PeepCodeNewsAppDelegate.m
//  PeepCodeNews
//
//  Created by Geoffrey Grosenbach on 8/14/09.
//  Copyright Topfunky Corporation 2009. All rights reserved.
//

#import "PeepCodeNewsAppDelegate.h"
#import "TFWebViewController.h"

@implementation PeepCodeNewsAppDelegate

@synthesize window;
@synthesize tabBarController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
  // Add the tab bar controller's current view as a subview of the window
  [window addSubview:tabBarController.view];
}

- (void)dealloc {
  [tabBarController release];
  [window release];
  [super dealloc];
}

@end

