//
//  YXKVOSwitchCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXKVOSwitchCell.h"


@implementation YXKVOSwitchCell

@synthesize object = _object;
@synthesize key = _key;

- (void)dealloc {
	self.object = nil;
	self.key = nil;

	[super dealloc];
}

+ (id)cellWithReuseIdentifier:(NSString*)reuseIdentifier withTitle:(NSString*)title 
				   withObject:(id)object withKey:(NSString*)key {
	YXKVOSwitchCell * cell = [[YXKVOSwitchCell alloc] initWithReuseIdentifier:reuseIdentifier];
	cell.title = title;
	cell.delegate = self;
	cell.initialValueGetter = @selector(initialValue:);
	cell.changeHandler = @selector(cell:changedValue:);
	
	cell.object = object;
	cell.key = key;
	
	return cell;
}

- (NSNumber*)initialValue:(YXKVOSwitchCell*)cell {
	return [_object valueForKey:_key];
}

- (void)cell:(YXKVOSwitchCell*)cell changedValue:(UISwitch*)switchControl {
	[_object setValue:[switchControl valueForKey:@"on"] forKey:_key];
}

@end
