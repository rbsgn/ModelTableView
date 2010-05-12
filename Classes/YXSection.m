//
//  YXSection.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXSection.h"


@implementation YXSection

@synthesize header = _header;
@synthesize footer = _footer;
@dynamic cells;

- (void)dealloc {
	[_cells release], _cells = nil;
	self.header = nil;
	self.footer = nil;

	[super dealloc];
}

- (id)initWithHeader:(NSString*)header footer:(NSString*)footer {
	if (self = [super init]) {
		_cells = [[NSMutableArray alloc] initWithCapacity:10];
		self.header = header;
		self.footer = footer;
	}
	return self;
}

+ (id)sectionWithHeader:(NSString*)header footer:(NSString*)footer {
	YXSection * section = [[YXSection alloc] initWithHeader:header footer:footer];
	return [section autorelease];
}

- (NSArray*)cells {
	return _cells;
}

- (void)addCell:(YXBasicCell*)cell {
	[_cells addObject:cell];
}

- (void)removeCell:(YXBasicCell*)cell {
	[_cells removeObject:cell];
}

@end
