//
//  YXKVOCheckmarkCell.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 6/30/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXCheckmarkCell.h"

@interface YXKVCCheckmarkCell : YXCheckmarkCell {
@private
	id _object;
	NSString * _key;
	SEL _updateAction;
	id _updateTarget;
}
@property (nonatomic, copy) NSString *key;
@property (nonatomic, retain) id object;

// like [updateTarget cellChangedValue:cell];
@property (nonatomic, assign) id updateTarget;
@property (nonatomic, assign) SEL updateAction;

+ (id)cellWithReuseIdentifier:(NSString*)reuseIdentifier 
						title:(NSString*)title
					   object:(id)object 
						  key:(NSString*)key;

@end
