//
//  YXSegmentedControlCellView.m
//  YXModelTableViews
//
//  Created by Roman Busyghin on 7/20/10.
//  Copyright 2010 Яндекс. All rights reserved.
//

#import "YXSegmentedControlViewCell.h"


@implementation YXSegmentedControlViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	return [self initWithSegmentedControlItems:nil reuseIdentifier:reuseIdentifier];
}

- (id)initWithSegmentedControlItems:(NSArray *)items reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
	if (self) {
        segmentedControl_ = [[UISegmentedControl alloc] initWithItems:items];
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		[self.contentView addSubview:segmentedControl_];
    }
    return self;
}

- (void)prepareForReuse {
	[super prepareForReuse];

	[self.segmentedControl removeAllSegments];
	[self.segmentedControl removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
}

- (void)setItems:(NSArray *)items {
	id lastItem = [items lastObject];
	SEL selector = NULL;

	if ([lastItem isKindOfClass:[NSString class]]) {
		selector = @selector(setTitle:forSegmentAtIndex:);
	}
	else if ([lastItem isKindOfClass:[UIImage class]]){
		selector = @selector(setImage:forSegmentAtIndex:);
	}
	else {
		return;
	}

	for (NSUInteger i = 0; i < [items count]; i++)
	{
		NSMethodSignature * signature = [self.segmentedControl methodSignatureForSelector:selector];
		NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:signature];

		[invocation setTarget:self.segmentedControl];
		[invocation setSelector:selector];
		[invocation setArgument:[items objectAtIndex:i] atIndex:2];
		[invocation setArgument:&i atIndex:3];

		[invocation invoke];
	}

	[self setNeedsLayout];
}

- (void)layoutSubviews {
	[super layoutSubviews];

	CGRect contentViewBounds = self.contentView.bounds;
	self.segmentedControl.frame = CGRectInset(contentViewBounds, -1.0f, -2.0f);
}


#pragma mark -
#pragma mark Memory management


@synthesize segmentedControl = segmentedControl_;


- (void)dealloc {
	[segmentedControl_ release];

    [super dealloc];
}


@end
