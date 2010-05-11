//
//  YXModelTableViewsViewController.m
//  YXModelTableViews
//
//  Created by Mikhail Kalugin on 5/11/10.
//  Copyright Yandex 2010. All rights reserved.
//

#import "YXModelTableViewsViewController.h"

#import "YXSwitchCell.h"
#import "YXDisclosureCell.h"
#import "YXButtonCell.h"

@implementation YXModelTableViewsViewController


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	YXSection * sectionA = [[YXSection alloc] initWithHeader:@"Section A" footer:nil];
	
	[sectionA addCell:[YXSwitchCell cellWithReuseIdentifier:@"cell0" 
												  withTitle:@"BOOM!" 
											   withDelegate:self 
										 initialValueGetter:@selector(cell0InitialValue:) 
											  changeHandler:@selector(cell0:changedValue:)]];
	[sectionA addCell:[YXDisclosureCell cellWithReuseIdentifier:@"cell1" 
													  withTitle:@"Advanced" 
												   withDelegate:self 
													   selector:@selector(cell1Tapped:)]];
	
	
	YXSection * sectionB = [[YXSection alloc] initWithHeader:nil footer:@"Section B"];
	[sectionB addCell:[YXSwitchCell cellWithReuseIdentifier:@"cell2" 
												  withTitle:@"BAH!1" 
											   withDelegate:self 
										 initialValueGetter:@selector(cell2InitialValue:) 
											  changeHandler:@selector(cell2:changedValue:)]];
	
	YXSection * sectionC = [[YXSection alloc] initWithHeader:@"Section C before" footer:@"Section C after"];
	[sectionC addCell:[YXButtonCell cellWithReuseIdentifier:@"buttonCell" 
												  withTitle:@"Button"
											   withDelegate:self 
												   selector:@selector(buttonCellTapped:)]];
	
	[self setSections:[NSArray arrayWithObjects:sectionA, sectionB, sectionC, nil]];
	
	[self.tableView reloadData];
}

- (NSNumber*)cell0InitialValue:(YXSwitchCell*)cell {
	return [NSNumber numberWithBool:NO];
}

- (void)cell0:(YXSwitchCell*)cell changedValue:(UISwitch*)switchControl {
	NSLog(@"cell0 changed value to %d", switchControl.on);
}

- (NSNumber*)cell2InitialValue:(YXSwitchCell*)cell {
	return [NSNumber numberWithBool:YES];
}

- (void)cell2:(YXSwitchCell*)cell changedValue:(UISwitch*)switchControl {
	NSLog(@"cell2 changed value to %d", switchControl.on);
}

- (void)cell1Tapped:(YXDisclosureCell*)cell {
	NSLog(@"cell1 tapped");
}

- (void)buttonCellTapped:(YXDisclosureCell*)cell {
	NSLog(@"button cell tapped");
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark TableView delegate methods



@end
