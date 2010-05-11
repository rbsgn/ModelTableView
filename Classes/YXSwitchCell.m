//
//  YMSwitchCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXSwitchCell.h"


@implementation YXSwitchCell

@synthesize title = _title;
@synthesize delegate = _delegate;
@synthesize initialValueGetter = _initialValueGetter;
@synthesize changeHandler = _changeHandler;

- (void)dealloc {
	self.title = nil;
	
	[super dealloc];
}

+ (id)cellWithReuseIdentifier:(NSString*)reuseIdentifier withTitle:(NSString*)title 
				 withDelegate:(id)delegate initialValueGetter:(SEL)initialValueGetter 
				changeHandler:(SEL)changeHandler {
	YXSwitchCell * cell = [[YXSwitchCell alloc] initWithReuseIdentifier:reuseIdentifier];
	cell.delegate = delegate;
	cell.title = title;
	cell.initialValueGetter = initialValueGetter;
	cell.changeHandler = changeHandler;
	return cell;
}

- (UITableViewCell*)tableViewCellWithReusableCell:(UITableViewCell*)reusableCell {
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
	
	[switchControl removeTarget:self action:NULL forControlEvents:UIControlEventAllEvents];

	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.textLabel.text = self.title;
	
	if (_delegate != nil && _initialValueGetter != NULL) { 
		switchControl.on = [[_delegate performSelector:_initialValueGetter withObject:self] boolValue];
	}
	
	[switchControl addTarget:self 
					  action:@selector(switchControlChanged:) 
			forControlEvents:UIControlEventValueChanged];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)switchControlChanged:(UISwitch*)switchControl {
	if (_delegate != nil && _changeHandler != NULL) {
		[_delegate performSelector:_changeHandler withObject:self withObject:switchControl];
	}
}

@end
