//
//  YXButtonCell.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXAbstractCell.h"

@interface YXButtonCell : YXAbstractCell {
@private
	NSString * title_;
	id target_;
	SEL action_;
}

@property (nonatomic, copy, readonly) NSString * title;
@property (nonatomic, assign, readonly) id target;
@property (nonatomic, assign, readonly) SEL action;

//
// Target must implement following action selector
//   - (void)buttonTapped:(YXButtonCell*)cell;
//
+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title 
					   target:(id)delegate action:(SEL)selector;

@end
