//
//  YXEditableViewCell.m
//  YXModelTableViews
//
//  Created by Roman Busyghin on 7/23/10.
//  Copyright 2010 Яндекс. All rights reserved.
//

#import "YXEditableViewCell.h"

@interface YXEditableViewCell ()

@property (nonatomic, retain) UITextField * textField;

@end

@implementation YXEditableViewCell

static const CGFloat kTextFieldMargin = 10.0f;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        textField_ = [[UITextField alloc] initWithFrame:CGRectZero];
		textField_.delegate = self;
		textField_.font = [UIFont systemFontOfSize:17.0f];
		textField_.textColor = [UIColor blackColor];
		textField_.textAlignment = UITextAlignmentLeft;
		textField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

		self.selectionStyle = UITableViewCellSelectionStyleNone;
		[self.contentView addSubview:textField_];
    }
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];

	CGRect textFieldFrame = CGRectInset(self.contentView.bounds, kTextFieldMargin, 0.0f);
	self.textField.frame = textFieldFrame;
}

- (void)setPlaceholder:(NSString *)newPlaceholder {
	self.textField.placeholder = newPlaceholder;
}

- (NSString *)placeholder {
	return self.textField.placeholder;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	[self.target performSelector:self.action withObject:textField];
}

@synthesize textField = textField_;
@synthesize target = target_;
@synthesize action = action_;


- (void)dealloc {
	[textField_ release];

    [super dealloc];
}


@end
