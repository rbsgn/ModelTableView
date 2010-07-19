//
//  YXSection.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YXBasicCell;

@interface YXSection : NSObject {
@private
	NSString * header_;
	NSString * footer_;
	NSMutableArray * cells_;
}

@property (nonatomic, readonly) NSString * header;
@property (nonatomic, readonly) NSString * footer;
@property (nonatomic, readonly) NSArray * cells;

- (id)initWithHeader:(NSString *)header footer:(NSString *)footer;
+ (id)sectionWithHeader:(NSString *)header footer:(NSString *)footer;

- (void)addCell:(YXBasicCell *)cell;
- (void)removeCell:(YXBasicCell *)cell;

@end
