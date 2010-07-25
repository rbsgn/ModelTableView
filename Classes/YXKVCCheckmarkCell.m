//
//  YXKVOCheckmarkCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 6/30/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXKVCCheckmarkCell.h"


@implementation YXKVCCheckmarkCell

@synthesize key = _key;
@synthesize object = _object;
@synthesize updateTarget = _updateTarget;
@synthesize updateAction = _updateAction;

- (void)dealloc {
	self.key = nil;
	self.object = nil;
	
	[super dealloc];
}

+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier 
						title:(NSString *)title
					   object:(id)object 
						  key:(NSString *)key
{
	YXKVCCheckmarkCell * cell = [[YXKVCCheckmarkCell alloc] initWithReuseIdentifier:reuseIdentifier];
	cell.title = title;
	cell.object = object;
	cell.key = key;
	cell.target = cell;
	cell.initialValueGetter = @selector(initialValue:);
	cell.action = @selector(checkmarkCell:changedValue:);
	
	return [cell autorelease];
}

- (NSNumber*)initialValue:(YXCheckmarkCell *)cell {
	return [self.object valueForKey:self.key];
}

- (void)checkmarkCell:(YXCheckmarkCell *)cell changedValue:(NSNumber *)value {
	[self.object setValue:value forKey:self.key];
	if (self.updateTarget && [self.updateTarget respondsToSelector:self.updateAction]) {
		[self.updateTarget performSelector:self.updateAction withObject:self];
	}
}

@end
