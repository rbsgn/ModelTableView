//
//  YXAbstractCell.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YXAbstractCell : NSObject {
@protected
	NSString * reuseIdentifier_;
	id userInfo_;
}

@property (nonatomic, readonly) NSString * reuseIdentifier;
@property (nonatomic, retain) id userInfo;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;

- (UITableViewCell *)tableViewCellWithReusableCell:(UITableViewCell *)reusableCell;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;

@end
