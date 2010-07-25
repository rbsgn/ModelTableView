//
//  YXStaticValueCell.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 6/29/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXKVCValueCell.h"

@interface YXStaticValueCell : YXKVCValueCell {
@private
	id _value;
}
@property (nonatomic, retain) id value;

+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title 
					value:(id)value;


@end
