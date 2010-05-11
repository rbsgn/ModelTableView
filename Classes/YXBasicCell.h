//
//  YXCell.h
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YXBasicCell : NSObject {
	NSString * _reuseIdentifier;
}
@property (nonatomic, copy) NSString *reuseIdentifier;

- (id)initWithReuseIdentifier:(NSString*)reuseIdentifier;

- (UITableViewCell*)tableViewCellWithReusableCell:(UITableViewCell*)reusableCell;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;

@end
