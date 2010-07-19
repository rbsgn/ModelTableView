//
//  YMSwitchCell.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXAbstractCell.h"

@interface YXSwitchCell : YXAbstractCell {
@protected
	NSString * title_;
	id target_;
	SEL initialValueGetter_;
	SEL action_;
}

@property (nonatomic, copy, readonly) NSString * title;
@property (nonatomic, assign, readonly) id target;
@property (nonatomic, assign, readonly) SEL initialValueGetter;
@property (nonatomic, assign, readonly) SEL action;

/* 
 Initial value getter is a method like: - (NSNumber*)valueForCell:(YXSwitchCell*)cell;
 Change handler has a form of: - (void)switchCell:(YXSwitchCell*)cell switchValueDidChange:(UISwitch*)switch;
 */
+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title 
				 target:(id)target initialValueGetter:(SEL)initialValueGetter action:(SEL)action;

@end
