//
//  YMSwitchCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXSwitchCell.h"

@interface YXSwitchCell ()

@property (nonatomic, copy, readwrite) NSString * title;
@property (nonatomic, assign, readwrite) id target;
@property (nonatomic, assign, readwrite) SEL initialValueGetter;
@property (nonatomic, assign, readwrite) SEL action;

@end


@implementation YXSwitchCell


#pragma mark -
#pragma mark Object lifecycle


+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title
					   target:(id)target initialValueGetter:(SEL)initialValueGetter
					   action:(SEL)action
{
	YXSwitchCell * cell = [[YXSwitchCell alloc] initWithReuseIdentifier:reuseIdentifier];

	cell.target = target;
	cell.title = title;
	cell.initialValueGetter = initialValueGetter;
	cell.action = action;

	return [cell autorelease];
}


#pragma mark -
#pragma mark Public interface


- (UITableViewCell *)tableViewCellWithReusableCell:(UITableViewCell *)reusableCell {
	UITableViewCell * cell = reusableCell;
	UISwitch *switchControl = nil;

	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.reuseIdentifier] autorelease];
		switchControl = [[UISwitch alloc] initWithFrame:CGRectZero];
		cell.accessoryView = switchControl;
		[switchControl release];
	} else {
		switchControl = (UISwitch *)[cell accessoryView];
	}

	[switchControl removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];

	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.textLabel.text = self.title;

	if (self.target != nil && self.initialValueGetter != NULL) {
		switchControl.on = [[self.target performSelector:self.initialValueGetter withObject:self] boolValue];
	}

	[switchControl addTarget:self action:@selector(switchControlChanged:)
			forControlEvents:UIControlEventValueChanged];

	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)switchControlChanged:(UISwitch *)switchControl {
	if (self.target != nil && self.action != NULL) {
		[self.target performSelector:self.action withObject:self withObject:switchControl];
	}
}


#pragma mark -
#pragma mark Memory management


@synthesize title = title_;
@synthesize target = target_;
@synthesize initialValueGetter = initialValueGetter_;
@synthesize action = action_;


- (void)dealloc {
	[title_ release];
	target_ = nil;
	action_ = NULL;
	initialValueGetter_ = NULL;

	[super dealloc];
}

@end
