//
//  YXButtonCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXButtonCell.h"

@interface YXButtonCell ()

@property (nonatomic, copy, readwrite) NSString * title;
@property (nonatomic, assign, readwrite) id target;
@property (nonatomic, assign, readwrite) SEL action;

@end


@implementation YXButtonCell


+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title 
					   target:(id)target action:(SEL)action
{
	YXButtonCell * cell = [[YXButtonCell alloc] initWithReuseIdentifier:reuseIdentifier];
	
	cell.target = target;
	cell.action = action;
	cell.title = title;
	
	return cell;
}

- (UITableViewCell*)tableViewCellWithReusableCell:(UITableViewCell *)reusableCell {
	UITableViewCell * cell = reusableCell;
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.reuseIdentifier] autorelease];
	}
	cell.textLabel.text = self.title;
	cell.textLabel.textAlignment = UITextAlignmentCenter;
	cell.textLabel.textColor = [UIColor colorWithRed:50.0f/255.0f
											   green:79.0f/255.0f
												blue:133.0f/255.0f
											   alpha:1.0f];
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
@synthesize target = target_;
@synthesize action = action_;


- (void)dealloc {
	target_ = nil;
	action_ = NULL;
	[title_ release];
	
	[super dealloc];
}

@end
