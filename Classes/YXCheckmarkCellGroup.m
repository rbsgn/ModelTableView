//
//  YXCheckmarkCellGroup.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 6/30/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXCheckmarkCellGroup.h"

@interface YXCheckmarkCellGroup ()

- (void)selectCell:(YXCheckmarkCell *)cell;
- (NSMutableArray *)mutableCells;

@end


@implementation YXCheckmarkCellGroup


#pragma mark -
#pragma mark Public interface


- (NSArray *)cells {
	return [NSArray arrayWithArray:cells_];
}

- (void)addCell:(YXCheckmarkCell *)cell setSelected:(BOOL)selected {
	NSAssert(cell != nil, @"");
	
	[[self mutableCells] addObject:cell];
	
	if (selected) {
		self.selectedCell = cell;
	}
	
	cell.target = self;
	cell.initialValueGetter = @selector(initialValueForCell:);
	cell.action = @selector(cell:changedValue:);
	cell.willChangeHandler = @selector(cell:willChangeValue:);
}

- (void)removeCell:(YXCheckmarkCell*)cell {
	NSAssert(cell != nil, @"");
	
	if (cell.target == self) {
		cell.target = nil;
	}
	
	[[self mutableCells] removeObject:cell];
	
	if (self.selectedCell == cell) { // cell can be already disposed here
		[self selectCell:nil];
	}
}


#pragma mark -
#pragma mark Checkmark cell callbacks


- (NSNumber *)initialValueForCell:(YXCheckmarkCell *)cell {
	BOOL boolValue = (cell == self.selectedCell);
	return [NSNumber numberWithBool:boolValue];
}

- (void)cell:(YXCheckmarkCell *)cell changedValue:(NSNumber *)selected {
	if ([selected boolValue] == YES) {
		[self selectCell:cell];
	}
}

- (BOOL)cell:(YXCheckmarkCell*)cell willChangeValue:(NSNumber*)selected {
	if (self.selectedCell == cell) {
		return NO;
	}
	return YES;
}


#pragma mark -
#pragma mark Private


- (void)selectCell:(YXCheckmarkCell *)cell {
	YXCheckmarkCell * previousCell = self.selectedCell;
	
	self.selectedCell = cell;
	
	if (previousCell != nil) {
		[previousCell update];
	}
	
	if ([self.target respondsToSelector:self.action]) {
		[self.target performSelector:self.action withObject:self withObject:cell];
	}
}

- (NSMutableArray *)mutableCells {
	if (cells_ == nil) {
		cells_ = [[NSMutableArray alloc] initWithCapacity:10];
	}
	return cells_;
}


#pragma mark -
#pragma mark Memory management


@synthesize target = target_;
@synthesize action = action_;
@synthesize selectedCell = selectedCell_;


- (void)dealloc {
	[selectedCell_ release];
	[cells_ release];
	
	[super dealloc];
}


@end
