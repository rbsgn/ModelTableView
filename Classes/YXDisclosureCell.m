//
//  YXDisclosureCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXDisclosureCell.h"


@implementation YXDisclosureCell

@synthesize valueTitle = _valueTitle;
@synthesize title = _title;
@synthesize delegate = _delegate;
@synthesize selector = _selector;

- (void)dealloc {
	self.delegate = nil;
	_selector = NULL;
	
	self.title = nil;
	
	self.valueTitle = nil;

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
	UITableViewCellStyle style = UITableViewCellStyleDefault;
	if (self.valueTitle != nil) {
		style = UITableViewCellStyleValue1;			
	}
	UITableViewCell * cell = reusableCell;
	if (cell == nil || (cell.detailTextLabel == nil && self.valueTitle != nil)) {		 
		cell = [[[UITableViewCell alloc] initWithStyle:style reuseIdentifier:self.reuseIdentifier] autorelease];
	}
	cell.textLabel.text = self.title;
	cell.detailTextLabel.text = self.valueTitle;
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
