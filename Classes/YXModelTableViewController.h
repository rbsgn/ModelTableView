//
//  YXModelTableViewController.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXCell.h"
#import "YXSection.h"

@interface YXModelTableViewController : UITableViewController {
	NSArray * _sections;
}
@property (nonatomic, retain) NSArray *sections;

@end
