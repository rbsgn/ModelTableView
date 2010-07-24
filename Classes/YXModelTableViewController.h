//
//  YXModelTableViewController.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXModelTableViewController : UITableViewController {
	NSArray * sections_;
}

@property (nonatomic, copy) NSArray * sections;

@end
