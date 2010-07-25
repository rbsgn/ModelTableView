//
//  YXEditableCell.m
//  YXModelTableViews
//
//  Created by Roman Busyghin on 7/23/10.
//  Copyright 2010 Яндекс. All rights reserved.
//

#import "YXEditableCell.h"
#import "YXEditableViewCell.h"


@interface YXEditableCell ()

@property (nonatomic, copy, readwrite) NSString * placeholder;
@property (nonatomic, assign, readwrite) id target;
@property (nonatomic, assign, readwrite) SEL action;

@end



@implementation YXEditableCell

- (void)dealloc {
	[placeholder_ release];

	[super dealloc];
}

+ (id)cellWithReuseIdentifier:(NSString*)reuseIdentifier target:(id)target
					   action:(SEL)action placeholder:(NSString *)placeholder
{
	YXEditableCell * cell = [[YXEditableCell alloc] initWithReuseIdentifier:reuseIdentifier];

	cell.target = target;
	cell.action = action;
	cell.placeholder = placeholder;

	return [cell autorelease];
}

- (UITableViewCell *)tableViewCellWithReusableCell:(UITableViewCell *)reusableCell {
	YXEditableViewCell * cell = nil;

	if (reusableCell == nil) {
		cell = [[[YXEditableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
										  reuseIdentifier:self.reuseIdentifier] autorelease];
	}
	else {
		cell = (YXEditableViewCell *)reusableCell;
	}


	cell.placeholder = self.placeholder;
	cell.target = self;
	cell.action = @selector(textDidChange:);

	return cell;
}

- (void)textDidChange:(UITextField *)textField {
	[self.target performSelector:self.action withObject:self withObject:textField];
}

@synthesize placeholder = placeholder_;
@synthesize target = target_;
@synthesize action = action_;

@end
