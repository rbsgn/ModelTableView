//
//  YXAbstractCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXAbstractCell.h"


@implementation YXAbstractCell


#pragma mark -
#pragma mark Object lifecycle 


- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
	self = [super init];
	if (self) {
		reuseIdentifier_ = [reuseIdentifier copy];
	}
	return self;
}


#pragma mark -
#pragma mark Public interface


- (UITableViewCell *)tableViewCellWithReusableCell:(UITableViewCell *)reusableCell  {
	@throw @"abstract method";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
}


#pragma mark -
#pragma mark Memory management


@synthesize reuseIdentifier = reuseIdentifier_;
@synthesize userInfo = userInfo_;
@synthesize image = image_;

- (void)dealloc {
	[reuseIdentifier_ release];
	[userInfo_ release];
	[image_ release];
	
	[super dealloc];
}

@end
