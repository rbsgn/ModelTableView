//
//  YXCustomizableCell.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXAbstractCell.h"

@interface YXCustomizableCell : YXAbstractCell {
	id _delegate;
	SEL _buildingSelector;
	SEL _selectionHandler;
	BOOL _deselectAutomatically;
}
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) SEL buildingSelector;
@property (nonatomic, assign) SEL selectionHandler;
@property (nonatomic, assign) BOOL deselectAutomatically;

/*
 Building selector is like - (UITableViewCell*)createTableCellForCell:(YXCell*)cell withReusable:(UITableViewCell*)reusable;
 */
+ (id)cellWithId:(NSString*)reuseIdentifier delegate:(id)delegate 
buildingSelector:(SEL)buildingSelector selectionHandler:(SEL)selectionHandler;

@end
