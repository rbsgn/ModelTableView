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
	NSString * _header;
	NSString * _footer;
	NSMutableArray * _cells;
}
@property (nonatomic, copy) NSString * header;
@property (nonatomic, copy) NSString * footer;
@property (nonatomic, readonly) NSArray * cells;

- (id)initWithHeader:(NSString*)header footer:(NSString*)footer;

+ (id)sectionWithHeader:(NSString*)header footer:(NSString*)footer;

- (void)addCell:(YXBasicCell*)cell;
- (void)removeCell:(YXBasicCell*)cell;

@end
