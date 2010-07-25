//
//  YXEditableCell.h
//  YXModelTableViews
//
//  Created by Roman Busyghin on 7/23/10.
//  Copyright 2010 Яндекс. All rights reserved.
//

#import "YXAbstractCell.h"


@interface YXEditableCell : YXAbstractCell {
@private
	NSString * placeholder_;
	id target_;
	SEL action_;
}

+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier target:(id)target
					   action:(SEL)action
				  placeholder:(NSString *)placeholder;

@property (nonatomic, copy, readonly) NSString * placeholder;
@property (nonatomic, assign, readonly) id target;
@property (nonatomic, assign, readonly) SEL action;

@end
