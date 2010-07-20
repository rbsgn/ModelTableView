//
//  YXKVOSwitchCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXKVCSwitchCell.h"

@interface YXKVCSwitchCell ()

@property (nonatomic, copy, readwrite) NSString * title;
@property (nonatomic, assign, readwrite) id target;
@property (nonatomic, assign, readwrite) SEL initialValueGetter;
@property (nonatomic, assign, readwrite) SEL action;

@property (nonatomic, readwrite, retain) NSObject * object;
@property (nonatomic, readwrite, copy) NSString * key;

@end


@implementation YXKVCSwitchCell


#pragma mark -
#pragma mark Object lifecycle


+ (id)cellWithReuseIdentifier:(NSString*)reuseIdentifier title:(NSString *)title
				   object:(id)object key:(NSString *)key {
	YXKVCSwitchCell * cell = [[YXKVCSwitchCell alloc] initWithReuseIdentifier:reuseIdentifier];

	cell.title = title;
	cell.target = cell;
	cell.initialValueGetter = @selector(initialValue:);
	cell.action = @selector(cell:changedValue:);

	cell.object = object;
	cell.key = key;

	return cell;
}

- (NSNumber *)initialValue:(YXKVCSwitchCell *)cell {
	return [self.object valueForKey:self.key];
}

- (void)cell:(YXKVCSwitchCell *)cell changedValue:(UISwitch *)switchControl {
	[self.object setValue:[switchControl valueForKey:@"on"] forKey:self.key];
}

- (void)setTitle:(NSString *)newTitle {
	if (newTitle != title_) {
		[title_ release];
		title_ = [newTitle copy];
	}
}

- (void)setTarget:(id)newTarget {
	target_ = newTarget;
}

- (void)setAction:(SEL)newAction {
	action_ = newAction;
}

- (void)setInitialValueGetter:(SEL)newInitialValueGetter {
	initialValueGetter_ = newInitialValueGetter;
}

#pragma mark -
#pragma mark Memory management


@synthesize object = object_;
@synthesize key = key_;
@dynamic title;
@dynamic target;
@dynamic initialValueGetter;
@dynamic action;


- (void)dealloc {
	[object_ release];
	[key_ release];

	[super dealloc];
}


@end
