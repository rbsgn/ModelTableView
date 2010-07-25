//
//  YXEditableViewCell.h
//  YXModelTableViews
//
//  Created by Roman Busyghin on 7/23/10.
//  Copyright 2010 Яндекс. All rights reserved.
//

#import <UIKit/UIKit.h>

// Doesn't implement valueSuffixLabel_

@interface YXEditableViewCell : UITableViewCell <UITextFieldDelegate> {
@private
	UITextField * textField_;
	UILabel * valueSuffixLabel_;
	id target_;
	SEL action_;
}

@property (nonatomic, assign) id target;
@property (nonatomic, assign) SEL action;
@property (nonatomic, retain) NSString * placeholder;

@end
