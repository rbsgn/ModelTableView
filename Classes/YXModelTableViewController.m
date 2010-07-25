//
//  YXModelTableViewController.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXModelTableViewController.h"

@implementation YXModelTableViewController


#pragma mark -
#pragma mark Initialization


- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
		sections_ = [[NSArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
	[self viewDidLoad];

	self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

#pragma mark -
#pragma mark Table view data source


- (YXAbstractCell *)modelCellAtIndexPath:(NSIndexPath *)indexPath {
	YXSection * section = [self.sections objectAtIndex:indexPath.section];
	YXAbstractCell * cell = [section.cells objectAtIndex:indexPath.row];
	return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [self.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
	YXSection * section = [self.sections objectAtIndex:sectionIndex];
	return [section.cells count];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)sectionIndex {
	YXSection * section = [self.sections objectAtIndex:sectionIndex];
	return section.footer;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)sectionIndex {
	YXSection * section = [self.sections objectAtIndex:sectionIndex];
	return section.header;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex {
	YXSection * section = [self.sections objectAtIndex:sectionIndex];
	return section.headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)sectionIndex {
	YXSection * section = [self.sections objectAtIndex:sectionIndex];
	return section.footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)sectionIndex {
	YXSection * section = [self.sections objectAtIndex:sectionIndex];
	if (section.footer == nil && section.footerView != nil) {
		return CGRectGetHeight(section.footerView.frame);
	}
	return -1.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex {
	YXSection * section = [self.sections objectAtIndex:sectionIndex];
	if (section.header == nil && section.headerView != nil) {
		return CGRectGetHeight(section.headerView.frame);
	}
	return -1.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	YXAbstractCell * cell = [self modelCellAtIndexPath:indexPath];
	UITableViewCell * reusableCell = [tableView dequeueReusableCellWithIdentifier:cell.reuseIdentifier];
	UITableViewCell * newCell = [cell tableViewCellWithReusableCell:reusableCell];

	if (reusableCell != nil && newCell != reusableCell) {
		NSLog(@"WARNING: reusable cell for id %@ was ignored", cell.reuseIdentifier);
	}

	return newCell;
}


#pragma mark -
#pragma mark Table view delegate 


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	YXAbstractCell * cell = [self modelCellAtIndexPath:indexPath];
	[cell tableView:tableView didSelectRowAtIndexPath:indexPath];
}

//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//	YXCell * cell = [self modelCellAtIndexPath:indexPath];
//	[cell tableView:tableView willSelectRowAtIndexPath:indexPath];
//}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	YXAbstractCell * cell = [self modelCellAtIndexPath:indexPath];
	[cell tableView:tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
}


#pragma mark -
#pragma mark Memory management


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


@synthesize sections = sections_;


- (void)dealloc {
	[sections_ release];

    [super dealloc];
}


@end

