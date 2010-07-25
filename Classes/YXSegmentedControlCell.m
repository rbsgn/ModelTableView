//
//  YXSegmentedControlCell.m
//  YXModelTableViews
//
//  Created by Roman Busyghin on 6/23/10.
//  Copyright 2010 Яндекс. All rights reserved.
//

#import "YXSegmentedControlCell.h"
#import "YXSegmentedControlViewCell.h"

@interface YXSegmentedControlCell ()

@property (nonatomic, readwrite, assign) id target;
@property (nonatomic, readwrite, assign) SEL action;
@property (nonatomic, readwrite, assign) SEL initialValueGetter;
@property (nonatomic, readwrite, retain) NSArray * segmentedControlItems;

@end


@implementation YXSegmentedControlCell


#pragma mark -
#pragma mark Object lifecycle


+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier segmentedControlItems:(NSArray *)items target:(id)target
					   action:(SEL)action initialValueGetter:(SEL)initialValueGetter
{
	YXSegmentedControlCell * cell = [[YXSegmentedControlCell alloc] initWithReuseIdentifier:reuseIdentifier];

	cell.segmentedControlItems = items;
	cell.target = target;
	cell.action = action;
	cell.initialValueGetter = initialValueGetter;

	return [cell autorelease];
}


#pragma mark -
#pragma mark Public interface


- (UITableViewCell *)tableViewCellWithReusableCell:(UITableViewCell *)reusableCell {
	YXSegmentedControlViewCell * cell = (YXSegmentedControlViewCell *)reusableCell;

	if (cell == nil) {
		cell = [[[YXSegmentedControlViewCell alloc] initWithSegmentedControlItems:self.segmentedControlItems
																  reuseIdentifier:self.reuseIdentifier] autorelease];
	}

	if (self.target != nil) {
		if (self.action != NULL) {
			[cell.segmentedControl addTarget:self action:@selector(segmentedControlDidChangeValue:)
							forControlEvents:UIControlEventValueChanged];
		}
		if (self.initialValueGetter != NULL) {

			NSMethodSignature * signature = [self.target methodSignatureForSelector:self.initialValueGetter];
			NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:signature];

			[invocation setTarget:self.target];
			[invocation setSelector:self.initialValueGetter];
			[invocation setArgument:self atIndex:2];

			[invocation invoke];

			NSInteger selectedSegmentIndex = -1;
			[invocation getReturnValue:&selectedSegmentIndex];

			cell.segmentedControl.selectedSegmentIndex = selectedSegmentIndex;
		}
	}

	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)segmentedControlDidChangeValue:(UISegmentedControl *)segmentedControl {
	if (self.target != nil && self.action != NULL) {
		[self.target performSelector:self.action withObject:self withObject:segmentedControl];
	}
}

#pragma mark -
#pragma mark Memory management


@synthesize segmentedControlItems = segmentedControlItems_;
@synthesize target = target_;
@synthesize action = action_;
@synthesize initialValueGetter = initialValueGetter_;

- (void)dealloc {
	[segmentedControlItems_ release];
	target_ = nil;
	action_ = NULL;
	initialValueGetter_ = NULL;

    [super dealloc];
}


@end
