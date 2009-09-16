//
//  PeepCodeNewsAppDelegate.h
//  PeepCodeNews
//
//  Created by Geoffrey Grosenbach on 8/14/09.
//  Copyright Topfunky Corporation 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeepCodeNewsAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
