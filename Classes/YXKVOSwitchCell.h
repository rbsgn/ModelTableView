//
//  YXKVOSwitchCell.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXSwitchCell.h"

@interface YXKVOSwitchCell : YXSwitchCell {
	NSObject * _object;
	NSString * _key;
}

@property (nonatomic, retain) NSObject *object;
@property (nonatomic, copy) NSString *key;

+ (id)cellWithReuseIdentifier:(NSString*)reuseIdentifier withTitle:(NSString*)title 
				   withObject:(id)object withKey:(NSString*)key;

@end
