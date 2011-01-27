//
//  YXModelTableViewsAppDelegate.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright Yandex 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YXModelTableViewsViewController;

@interface YXModelTableViewsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    YXModelTableViewsViewController * viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
//@property (nonatomic, retain) IBOutlet YXModelTableViewsViewController *viewController;

@end

