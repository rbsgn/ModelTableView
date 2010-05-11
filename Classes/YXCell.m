//
//  YXCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXCell.h"


@implementation YXCell

@synthesize deselectAutomatically = _deselectAutomatically;
@synthesize delegate = _delegate;
@synthesize buildingSelector = _buildingSelector;
@synthesize selectionHandler = _selectionHandler;

- (void)dealloc {
	self.delegate = nil;


	[super dealloc];
}

+ (id)cellWithId:(NSString*)reuseIdentifier delegate:(id)delegate 
buildingSelector:(SEL)buildingSelector selectionHandler:(SEL)selectionHandler {
	YXCell * cell = [[YXCell alloc] initWithReuseIdentifier:reuseIdentifier];
	cell.delegate = delegate;
	cell.buildingSelector = buildingSelector;
	cell.selectionHandler = selectionHandler;
	cell.deselectAutomatically = YES;
	return [cell autorelease];
}

- (UITableViewCell*)tableViewCellWithReusableCell:(UITableViewCell*)reusableCell {
	if (_delegate != nil && _buildingSelector != NULL) {
		return [_delegate performSelector:_buildingSelector withObject:self withObject:reusableCell];
	}
	return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (_deselectAutomatically) {
		[tableView deselectRowAtIndexPath:indexPath animated:NO];
	}
	
	if (_delegate != nil && _selectionHandler != NULL) {
		[_delegate performSelector:_selectionHandler withObject:nil];
	}
}

@end
