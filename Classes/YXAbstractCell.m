//
//  YXCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXAbstractCell.h"


@implementation YXAbstractCell

@synthesize reuseIdentifier = _reuseIdentifier;

- (void)dealloc {
	self.reuseIdentifier = nil;

	[super dealloc];
}

- (id)initWithReuseIdentifier:(NSString*)reuseIdentifier {
	if (self = [super init]) {
		self.reuseIdentifier = reuseIdentifier;
	}
	return self;
}

- (UITableViewCell*)tableViewCellWithReusableCell:(UITableViewCell*)reusableCell  {
	@throw @"abstract method";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
}

@end
