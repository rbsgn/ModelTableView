//
//  YXSegmentedControlCellView.h
//  YXModelTableViews
//
//  Created by Roman Busyghin on 7/20/10.
//  Copyright 2010 Яндекс. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YXSegmentedControlViewCell : UITableViewCell {
@private
	UISegmentedControl * segmentedControl_;
}

@property (nonatomic, readonly) UISegmentedControl * segmentedControl;

// Designated initializer
- (id)initWithSegmentedControlItems:(NSArray *)items reuseIdentifier:(NSString *)reuseIdentifier;

- (void)setItems:(NSArray *)items;

@end
