constants
defaultConfigurationDictionary

	^ Dictionary newFrom: {
		'name' -> 'accountname'.
		'address' -> 'imap.test.de'.
		'port' -> '42'.
		'username' -> 'test@test.test'.
		'ssl' -> true.
		} 