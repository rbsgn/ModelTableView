//
//  YXCheckmarkCell.m
//  YXModelTableViews
//
//  Created by Roman Busyghin on 5/17/10.
//  Copyright 2010 Яндекс. All rights reserved.
//

#import "YXCheckmarkCell.h"
#import "YXCheckmarkCellGroup.h"

@interface YXCheckmarkCell ()

- (UITableViewCellAccessoryType)accessoryTypeForBool:(BOOL)flag;
- (BOOL)boolForAccessoryType:(UITableViewCellAccessoryType)accessoryType;
- (BOOL)delegateAllowsToChangeTo:(BOOL)newValue;

@property (nonatomic, retain) UITableViewCell * lastCreatedTableCell;

@end


@implementation YXCheckmarkCell


#pragma mark -
#pragma mark Object lifecycle


+ (id)cellWithReuseIdentifier:(NSString*)reuseIdentifier 
						title:(NSString*)title
					   target:(id)target 
		   initialValueGetter:(SEL)initialValueGetter 
					   action:(SEL)action
{
	NSAssert(target != nil, @"");
	NSAssert([target respondsToSelector:initialValueGetter], @"");
	NSAssert([target respondsToSelector:action], @"");
	
	YXCheckmarkCell * cell = [[YXCheckmarkCell alloc] initWithReuseIdentifier:reuseIdentifier];
	cell.title = title;
	cell.target = target;
	cell.initialValueGetter = initialValueGetter;
	cell.action = action;
	
	return [cell autorelease];
}

+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier 
						title:(NSString *)title
						group:(YXCheckmarkCellGroup *)group
					 selected:(BOOL)selected
{
	YXCheckmarkCell * cell = [[YXCheckmarkCell alloc] initWithReuseIdentifier:reuseIdentifier];
	cell.title = title;
	
	[group addCell:cell setSelected:selected];
	
	return [cell autorelease];
}

- (UITableViewCell*)tableViewCellWithReusableCell:(UITableViewCell*)reusableCell {
	UITableViewCell * cell = reusableCell;
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									   reuseIdentifier:self.reuseIdentifier] autorelease];
	}
	
	cell.textLabel.text = self.title;
	
	NSNumber * boolNumber = [self.target performSelector:self.initialValueGetter
											  withObject:self];
	cell.accessoryType = [self accessoryTypeForBool:[boolNumber boolValue]];
	
	self.lastCreatedTableCell = cell;
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	
	BOOL previousValue = [self boolForAccessoryType:cell.accessoryType];
	BOOL newValue = !previousValue;
	
	BOOL shouldUpdate = [self delegateAllowsToChangeTo:newValue];
	if (shouldUpdate) {	
		cell.accessoryType = [self accessoryTypeForBool:newValue];
		[self.target performSelector:self.action
						  withObject:self 
						  withObject:[NSNumber numberWithBool:newValue]];	
	}
}

- (void)update {
	if (self.lastCreatedTableCell == nil) {
		return;
	}
	
	NSNumber * boolNumber = [self.target performSelector:self.initialValueGetter
											  withObject:self];
	self.lastCreatedTableCell.accessoryType = [self accessoryTypeForBool:[boolNumber boolValue]];
}


#pragma mark -
#pragma mark Private


- (UITableViewCellAccessoryType)accessoryTypeForBool:(BOOL)flag {
	if (flag) {
		return UITableViewCellAccessoryCheckmark;
	}
	else {
		return UITableViewCellAccessoryNone;
	}
}

- (BOOL)boolForAccessoryType:(UITableViewCellAccessoryType)accessoryType {
	if (accessoryType == UITableViewCellAccessoryCheckmark) {
		return YES;
	}
	else {
		return NO;
	}
}

- (BOOL)delegateAllowsToChangeTo:(BOOL)newValue {
	if (![self.target respondsToSelector:self.willChangeHandler]) {
		return YES;
	}
	
	NSNumber * boolNumber = [NSNumber numberWithBool:newValue];
	
	NSMethodSignature * signature = [self.target methodSignatureForSelector:self.willChangeHandler];
	NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:signature];
	[invocation setTarget:self.target];
	[invocation setSelector:self.willChangeHandler];
	[invocation setArgument:&self atIndex:2];
	[invocation setArgument:&boolNumber atIndex:3];
	
	[invocation invoke];
	
	BOOL returnValue = YES;
	[invocation getReturnValue:&returnValue];
	
	
	return returnValue;
}


@synthesize title = title_;
@synthesize target = target_;
@synthesize initialValueGetter = initialValueGetter_;
@synthesize action = action_;
@synthesize willChangeHandler = willChangeHandler_;
@synthesize lastCreatedTableCell = lastCreatedTableCell_;


- (void)dealloc {
	[title_ release];
	[lastCreatedTableCell_ release];
	
	[super dealloc];
}

@end
