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
	NSString * _title;
	id _delegate;
	SEL _selector;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) SEL selector;

// selector is a method like - (void)buttonTapped:(YXButtonCell*)cell;
+ (id)cellWithReuseIdentifier:(NSString*)reuseIdentifier withTitle:(NSString*)title 
				 withDelegate:(id)delegate selector:(SEL)selector;

@end
