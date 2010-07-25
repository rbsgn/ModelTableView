//
//  YXSegmentedControlCell.h
//  YXModelTableViews
//
//  Created by Roman Busyghin on 6/23/10.
//  Copyright 2010 Яндекс. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXAbstractCell.h"

@interface YXSegmentedControlCell : YXAbstractCell {
@private
	NSArray * segmentedControlItems_;
	id target_;
	SEL action_;
	SEL initialValueGetter_;
}

@property (nonatomic, readonly, assign) id target;
@property (nonatomic, readonly, assign) SEL action;
@property (nonatomic, readonly, assign) SEL initialValueGetter;
@property (nonatomic, readonly, retain) NSArray * segmentedControlItems;

//
// Target must implement initialValueGetter that looks like:
// - (NSUInteger)indexOfSelectedItemForCell:(YXSegmentedControlCell *)cell;
//
+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier segmentedControlItems:(NSArray *)items target:(id)target
					   action:(SEL)action initialValueGetter:(SEL)initialValueGetter;

@end
