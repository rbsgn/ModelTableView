Using this class you can create static table views declared the following way:

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

