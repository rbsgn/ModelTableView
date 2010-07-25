//
//  YXStaticValueCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 6/29/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXStaticValueCell.h"


@implementation YXStaticValueCell

@synthesize value = _value;

- (void)dealloc {
	self.value = nil;

	[super dealloc];
}

+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title 
					value:(id)value 
{
	YXStaticValueCell * cell = [[YXStaticValueCell alloc] initWithReuseIdentifier:reuseIdentifier];
	cell.title = title;
	cell.object = cell;
	cell.key = @"value";
	cell.value = value;
	
	return [cell autorelease];
}

@end
