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
@private
	NSObject * object_;
	NSString * key_;
}

@property (nonatomic, readonly, retain) NSObject * object;
@property (nonatomic, readonly, copy) NSString * key;

+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title 
				   object:(id)object key:(NSString *)key;

@end
