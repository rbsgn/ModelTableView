//
//  YXCheckmarkCellGroup.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 6/30/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXCheckmarkCell.h"

@interface YXCheckmarkCellGroup : NSObject {
@private
	NSMutableArray * cells_;
	YXCheckmarkCell * selectedCell_;
	
	id target_;
	SEL action_; // checkmarkCellGroup:group selectedCell:cell
}

@property (nonatomic, readonly) NSArray * cells;
@property (nonatomic, assign) YXCheckmarkCell * selectedCell;

@property (nonatomic, assign) id target;
@property (nonatomic, assign) SEL action;

- (void)addCell:(YXCheckmarkCell *)cell setSelected:(BOOL)selected;
- (void)removeCell:(YXCheckmarkCell *)cell;

@end
