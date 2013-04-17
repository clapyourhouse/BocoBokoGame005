//
//  AppDelegate.h
//  BocoBokoGame
//
//  Created by 彰悟 北村 on 12/09/20.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;
//@class AdRootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
    //    AdRootViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) RootViewController *viewController;

@end
