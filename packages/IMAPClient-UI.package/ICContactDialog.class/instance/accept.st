action
accept

	ICAddressBook new addEmail: (ICContact newWith: self email with: self contactName) asString.
	self addressBookDialog invalidateSorting.
	self addressBookDialog changed: #addressBook