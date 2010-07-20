//
//  YXSection.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXSection.h"


@implementation YXSection


#pragma mark -
#pragma mark Objec lifecycle

- (id)init {
	return [self initWithHeader:nil footer:nil];
}

- (id)initWithHeader:(NSString *)header footer:(NSString *)footer {
	self = [super init];
	if (self) {
		cells_ = [[NSMutableArray alloc] init];
		header_ = [header copy];
		footer_ = [footer copy];
	}
	return self;
}

+ (id)section {
	return [[self class] sectionWithHeader:nil footer:nil];
}

+ (id)sectionWithHeader:(NSString *)header footer:(NSString *)footer {
	return [[[[self class] alloc] initWithHeader:header footer:footer] autorelease];
}


#pragma mark -
#pragma mark Public interface


- (NSArray *)cells {
	return [[cells_ copy] autorelease];
}

- (void)addCell:(YXAbstractCell *)cell {
	[cells_ addObject:cell];
}

- (void)removeCell:(YXAbstractCell *)cell {
	[cells_ removeObject:cell];
}


#pragma mark -
#pragma mark Memory management


@synthesize header = header_;
@synthesize footer = footer_;


- (void)dealloc {
	[cells_ release];
	[header_ release];
	[footer_ release];

	[super dealloc];
}


@end
