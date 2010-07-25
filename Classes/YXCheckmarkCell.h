//
//  YXCheckmarkCell.h
//  YXModelTableViews
//
//  Created by Roman Busyghin on 5/17/10.
//  Copyright 2010 Яндекс. All rights reserved.
//

#import "YXAbstractCell.h"

@class YXCheckmarkCellGroup;

@interface YXCheckmarkCell : YXAbstractCell {
@private
	NSString * title_;
	
	id target_;
	SEL initialValueGetter_;
	SEL action_;
	SEL willChangeHandler_;
	
	UITableViewCell * lastCreatedTableCell_;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) id target;
@property (nonatomic, assign) SEL initialValueGetter;
@property (nonatomic, assign) SEL action;
@property (nonatomic, assign) SEL willChangeHandler; // like action, but returns BOOL

/* 
 Initial value getter is a method like: - (NSNumber*)valueForCell:(YXSwitchCell*)cell;
 Change handler has a form of: - (void)checkmarkCell:(YXCheckmarkCell*)cell checkmarkValueDidChange:(NSNumber*)checked;
 */
+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier 
						title:(NSString *)title
					   target:(id)target 
		   initialValueGetter:(SEL)initialValueGetter 
					   action:(SEL)action;

+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier 
						title:(NSString *)title
						group:(YXCheckmarkCellGroup *)group
					 selected:(BOOL)selected;

- (void)update;

@end
