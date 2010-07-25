//
//  YXKVOValueCell.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 6/29/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXKVCValueCell.h"


@implementation YXKVCValueCell


#pragma mark -
#pragma mark Object lifecycle


+ (id)cellWithReuseIdentifier:(NSString*)reuseIdentifier title:(NSString*)title 
				   object:(id)object key:(NSString*)key {
	YXKVCValueCell * cell = [[YXKVCValueCell alloc] initWithReuseIdentifier:reuseIdentifier];
	cell.title = title;
	cell.object = object;
	cell.key = key;
	
	return [cell autorelease];
}


#pragma mark -
#pragma mark Public interface 


- (UITableViewCell *)tableViewCellWithReusableCell:(UITableViewCell *)reusableCell {
	UITableViewCell * cell = reusableCell;
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 
									   reuseIdentifier:self.reuseIdentifier] autorelease];
	} 
	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.textLabel.text = self.title;
	cell.detailTextLabel.text = [[self.object valueForKey:self.key] description];
	
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
}


#pragma mark -
#pragma mark Memory management


@synthesize title = _title;
@synthesize object = _object;
@synthesize key = _key;


- (void)dealloc {
	[_object release];
	[_key release];
	[_title release];
	
	[super dealloc];
}

@end
