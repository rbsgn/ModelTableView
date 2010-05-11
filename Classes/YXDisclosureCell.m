//
//  YXDisclosureCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXDisclosureCell.h"


@implementation YXDisclosureCell

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
	YXDisclosureCell * cell = [[YXDisclosureCell alloc] initWithReuseIdentifier:reuseIdentifier];
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
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if (_delegate != nil && _selector != NULL) {
		[_delegate performSelector:_selector withObject:self];
	}
}

@end
