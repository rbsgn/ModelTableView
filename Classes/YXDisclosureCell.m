//
//  YXDisclosureCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXDisclosureCell.h"

@interface YXDisclosureCell ()

@property (nonatomic, copy, readwrite) NSString * title;
@property (nonatomic, copy, readwrite) NSString * value;
@property (nonatomic, assign, readwrite) id target;
@property (nonatomic, assign, readwrite) SEL action;

@end


@implementation YXDisclosureCell


#pragma mark -
#pragma mark Object lifecycle


+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title {
	return [[self class] cellWithReuseIdentifier:reuseIdentifier title:title value:nil target:nil action:NULL];
}

+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title value:(NSString *)value {
	return [[self class] cellWithReuseIdentifier:reuseIdentifier title:title value:value target:nil action:NULL];
}

+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title value:(NSString *)value target:(id)target action:(SEL)action
{
	YXDisclosureCell * cell = [[YXDisclosureCell alloc] initWithReuseIdentifier:reuseIdentifier];

	cell.title = title;
	cell.value = value;
	cell.target = target;
	cell.action = action;

	return [cell autorelease];
}


#pragma mark -
#pragma mark Public interface


- (UITableViewCell *)tableViewCellWithReusableCell:(UITableViewCell *)reusableCell {
	UITableViewCellStyle style = UITableViewCellStyleDefault;
	if (self.value != nil) {
		style = UITableViewCellStyleValue1;
	}

	UITableViewCell * cell = reusableCell;
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:style reuseIdentifier:self.reuseIdentifier] autorelease];
	}

	cell.textLabel.text = self.title;
	cell.detailTextLabel.text = self.value;

	if (self.target != nil && self.action != NULL) {
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}

	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	if (self.target != nil && self.action != NULL) {
		[self.target performSelector:self.action withObject:self];
	}
}


#pragma mark -
#pragma mark Memory management


@synthesize title = title_;
@synthesize value = value_;
@synthesize target = target_;
@synthesize action = action_;


- (void)dealloc {
	target_ = nil;
	action_ = NULL;

	[title_ release];
	[value_ release];

	[super dealloc];
}

@end
