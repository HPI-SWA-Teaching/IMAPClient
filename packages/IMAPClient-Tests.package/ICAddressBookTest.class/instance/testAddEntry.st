adding entries
testAddEntry

	self addressBook addEmail: self emailContact.
	
	self assert: self addressBook size equals: 1