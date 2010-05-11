//
//  YXButtonCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXButtonCell.h"


@implementation YXButtonCell

@synthesize title = _title;
@synthesize delegate = _delegate;
@synthesize selector = _selector;

- (void)dealloc {
	self.delegate = nil;
	_selector = NULL;

	self.title = nil;

	[super dealloc];
}

+ (id)cellWithReuseIdentifier:(NSString*)reuseIdentifier withTitle:(NSString*)title 
				 withDelegate:(id)delegate selector:(SEL)selector {
	YXButtonCell * cell = [[YXButtonCell alloc] initWithReuseIdentifier:reuseIdentifier];
	cell.delegate = delegate;
	cell.selector = selector;
	cell.title = title;
	return cell;
}

- (UITableViewCell*)tableViewCellWithReusableCell:(UITableViewCell*)reusableCell {
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
	
	if (_delegate != nil && _selector != NULL) {
		[_delegate performSelector:_selector withObject:self];
	}
}

@end
