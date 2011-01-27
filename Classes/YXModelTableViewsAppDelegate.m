//
//  YXModelTableViewsAppDelegate.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright Yandex 2010. All rights reserved.
//

#import "YXModelTableViewsAppDelegate.h"
#import "YXModelTableViewsViewController.h"

@implementation YXModelTableViewsAppDelegate

@synthesize window;
//@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch
    viewController = [[YXModelTableViewsViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];

    [super dealloc];
}


@end
