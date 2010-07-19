//
//  YXModelTableViewController.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright 2010 Yandex. All rights reserved.
//

#import "YXModelTableViewController.h"


@implementation YXModelTableViewController

@synthesize sections = _sections;


#pragma mark -
#pragma mark Initialization


- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if ((self = [super initWithStyle:style])) {
		_sections = [[NSArray alloc] init];
    }
    return self;
}



#pragma mark -
#pragma mark Table view data source

- (void)setSections:(NSArray*)sections {
	_sections = [sections retain];
}

- (YXAbstractCell *)modelCellAtIndexPath:(NSIndexPath *)indexPath {
	YXSection * section = [_sections objectAtIndex:indexPath.section];
	YXAbstractCell * cell = [section.cells objectAtIndex:indexPath.row];
	return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [_sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionNum {
	YXSection * section = [_sections objectAtIndex:sectionNum];
	return [section.cells count];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)sectionNum {
	YXSection * section = [_sections objectAtIndex:sectionNum];
	return section.footer;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)sectionNum {
	YXSection * section = [_sections objectAtIndex:sectionNum];
	return section.header;
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
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	self.sections = nil;

    [super dealloc];
}


@end

