//
//  YXDisclosureCell.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXAbstractCell.h"

@interface YXDisclosureCell : YXAbstractCell {
@private
	NSString * title_;
	NSString * value_;
	id target_;
	SEL action_;
}

@property (nonatomic, copy, readonly) NSString * title;
@property (nonatomic, copy, readonly) NSString * value;
@property (nonatomic, assign, readonly) id target;
@property (nonatomic, assign, readonly) SEL action;


//
// Target must implement following action selector
//   - (void)disclosureTapped:(YXDisclosureCell *)cell;
//

+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title;
+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title value:(NSString *)value;
+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title value:(NSString *)value target:(id)delegate action:(SEL)selector;

@end
