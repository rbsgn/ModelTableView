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
	NSString * _title;
	id _delegate;
	SEL _initialValueGetter;
	SEL _changeHandler;
}
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) SEL initialValueGetter;
@property (nonatomic, assign) SEL changeHandler;

/* 
 Initial value getter is a method like: - (NSNumber*)valueForCell:(YXSwitchCell*)cell;
 Change handler has a form of: - (void)switchCell:(YXSwitchCell*)cell switchValueDidChange:(UISwitch*)switch;
 */
+ (id)cellWithReuseIdentifier:(NSString*)reuseIdentifier withTitle:(NSString*)title 
				 withDelegate:(id)delegate initialValueGetter:(SEL)initialValueGetter 
				changeHandler:(SEL)changeHandler;

@end
