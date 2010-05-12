YXModelTableViews
=================

Using this mini-framework you can simpify creation of settings-like/card-like table views. All you need is to subclass your view controller from YXModelTableViewController and set its sections with code like the following:

	YXSection * sectionA = [[YXSection alloc] initWithHeader:@"Section A" footer:nil];

	// Just a cell with a title and switch control at the right. You provice two
	// callbacks: the first returns an initial value and the second is called
	// when user chcnges the switch
	[sectionA addCell:[YXSwitchCell cellWithReuseIdentifier:@"cell0" 
												  withTitle:@"BOOM!" 
											   withDelegate:self 
										 initialValueGetter:@selector(cell0InitialValue:) 
											  changeHandler:@selector(cell0:changedValue:)]];
											
	// A cell with title (and possible a detail/value text) with a disclosure indicator
	// at the right. You provide a callback which is called after the cell was tapped.
	[sectionA addCell:[YXDisclosureCell cellWithReuseIdentifier:@"cell1" 
													  withTitle:@"Advanced" 
												   withDelegate:self 
													   selector:@selector(cell1Tapped:)]];
													
	// This cell looks like YXSwitchCell but it is provided with object/key
	// information. So it takes an initial value itself and updates it
	// when user changes the value.
	[sectionA addCell:[YXKVOSwitchCell cellWithReuseIdentifier:@"kvoCell" 
				withTitle:@"KVO Bound Cell" 
			   withObject:defaults 
				  withKey:@"myPreferenceKey"]];
													


	YXSection * sectionB = [[YXSection alloc] initWithHeader:nil footer:@"Section B"];
	[sectionB addCell:[YXSwitchCell cellWithReuseIdentifier:@"cell2" 
												  withTitle:@"BAH!1" 
											   withDelegate:self 
										 initialValueGetter:@selector(cell2InitialValue:) 
											  changeHandler:@selector(cell2:changedValue:)]];

	YXSection * sectionC = [[YXSection alloc] initWithHeader:@"Section C before" footer:@"Section C after"];
	
	// A cell which looks like a button (its label is blue and centered).
	[sectionC addCell:[YXButtonCell cellWithReuseIdentifier:@"buttonCell" 
												  withTitle:@"Button"
											   withDelegate:self 
												   selector:@selector(buttonCellTapped:)]];


	[self setSections:[NSArray arrayWithObjects:sectionA, sectionB, sectionC, nil]];

After this you usually better to call [self.tableView reloadData] since setSections: doesn't do that.