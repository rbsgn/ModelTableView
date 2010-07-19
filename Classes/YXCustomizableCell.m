//
//  YXCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXCustomizableCell.h"

@interface YXCustomizableCell ()

@property (nonatomic, assign, readwrite) id target;
@property (nonatomic, assign, readwrite) SEL buildingSelector;
@property (nonatomic, assign, readwrite) SEL selectionHandler;
@property (nonatomic, assign, readwrite) BOOL deselectsAutomatically;

@end


@implementation YXCustomizableCell


#pragma mark -
#pragma mark Object lifecycle


+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier target:(id)target buildingSelector:(SEL)buildingSelector selectionHandler:(SEL)selectionHandler {
	YXCustomizableCell * cell = [[YXCustomizableCell alloc] initWithReuseIdentifier:reuseIdentifier];
	cell.target = target;
	cell.buildingSelector = buildingSelector;
	cell.selectionHandler = selectionHandler;
	cell.deselectsAutomatically = YES;
	
	return [cell autorelease];
}


#pragma mark -
#pragma mark Public interface


- (UITableViewCell *)tableViewCellWithReusableCell:(UITableViewCell *)reusableCell {
	if (self.target != nil && self.buildingSelector != NULL) {
		return [self.target performSelector:self.buildingSelector withObject:self withObject:reusableCell];
	}
	return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (self.deselectsAutomatically) {
		[tableView deselectRowAtIndexPath:indexPath animated:NO];
	}
	
	if (self.target != nil && self.selectionHandler != NULL) {
		[self.target performSelector:self.selectionHandler withObject:nil];
	}
}


#pragma mark -
#pragma mark Memory management


@synthesize deselectsAutomatically = deselectsAutomatically_;
@synthesize target = target_;
@synthesize buildingSelector = buildingSelector_;
@synthesize selectionHandler = selectionHandler_;


- (void)dealloc {
	target_ = nil;
	
	[super dealloc];
}

@end
