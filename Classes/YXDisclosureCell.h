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
	NSString * _title;
	NSString * _valueTitle;
	id _delegate;
	SEL _selector;
}

@property (nonatomic, copy) NSString *valueTitle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) SEL selector;

// selector is a method like - (void)disclosureTapped:(YXDisclosureCell*)cell;
+ (id)cellWithReuseIdentifier:(NSString*)reuseIdentifier withTitle:(NSString*)title 
				 withDelegate:(id)delegate selector:(SEL)selector;

@end
