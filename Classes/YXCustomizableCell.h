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
@private
	id target_;
	SEL buildingSelector_;
	SEL selectionHandler_;
	BOOL deselectsAutomatically_;
}

@property (nonatomic, assign, readonly) id target;
@property (nonatomic, assign, readonly) SEL buildingSelector;
@property (nonatomic, assign, readonly) SEL selectionHandler;
@property (nonatomic, assign, readonly) BOOL deselectsAutomatically;

//
// Target must implement following building selector. Target is responsible
// for checking 'reusable' argument and creating UITableViewCell if it is nil
//
//   - (UITableViewCell *)createTableCellForCell:(YXCustomizableCell *)cell withReusable:(UITableViewCell *)reusable;
//
// Selection selector signature:
// 
+ (id)cellWithReuseIdentifier:(NSString *)reuseIdentifier target:(id)target buildingSelector:(SEL)buildingSelector selectionHandler:(SEL)selectionHandler;

@end
