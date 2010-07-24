//
//  YXSection.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class YXAbstractCell;

@interface YXSection : NSObject {
@private
	NSString * header_;
	NSString * footer_;

	UIView * headerView_;
	UIView * footerView_;

	NSMutableArray * cells_;
}

@property (nonatomic, readonly) NSString * header;
@property (nonatomic, readonly) NSString * footer;

@property (nonatomic, retain) UIView *footerView;
@property (nonatomic, retain) UIView *headerView;

@property (nonatomic, readonly) NSArray * cells;

- (id)init;
- (id)initWithHeader:(NSString *)header footer:(NSString *)footer;

+ (id)section;
+ (id)sectionWithHeader:(NSString *)header footer:(NSString *)footer;

- (void)addCell:(YXAbstractCell *)cell;
- (void)removeCell:(YXAbstractCell *)cell;

@end
