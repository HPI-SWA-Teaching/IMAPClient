logout
testRetrieveFlagsOnly

	| folder mailA mailB emailObjects folderName mailAPath mailBPath path |
	"Load emails from server and store them locally"
	
	"To test the functionality I need ICEMails, which are already present in storage, 
	 so I can check whether the flags are updated" 
	emailObjects := self endPoint maildirDiffFetchHeadersFrom: '3' to: '4'.
	mailA := emailObjects first.
	mailB := emailObjects second.
	
	folder := emailObjects first folder.
	folder addMails: emailObjects.
	
	folderName := self endPoint rootDirectoryName.
	path := 'Maildir', FileDirectory slash, folderName, FileDirectory slash, 'inbox'.
	mailAPath := FileDirectory default fullPathFor: path , FileDirectory slash, '3' .
	mailBPath := FileDirectory default fullPathFor: path , FileDirectory slash, '4' .
	
	"Asserts that in the beginning the flags equal this"
	self assert: mailA seen equals: true.
	self assert: mailA flagged equals: false.
	self assert: mailA deleted equals: false.
	self assert: mailB seen equals: true.
	self assert: mailB flagged equals: false.
	self assert: mailB deleted equals: false.
	
	"Now retrive flags to trigger update"
	self endPoint retrieveFlagsFrom: 3 to: 4 in: folder.
	
	"Asserts that the flags - in the mail object - were updated"
	self assert: mailA seen equals: false.
	self assert: mailA flagged equals: true.
	self assert: mailA deleted equals: false.
	self assert: mailB seen equals: false.
	self assert: mailB flagged equals: true.
	self assert: mailB deleted equals: false.
	
	"Asserts that the flags - in the maildir storage file - were also updated"
	mailA := ICEmail newFromJsonStream: (FileStream readOnlyFileNamed: mailAPath).
	mailB := ICEmail newFromJsonStream: (FileStream readOnlyFileNamed: mailBPath).
	
	self assert: mailA seen equals: false.
	self assert: mailA flagged equals: true.
	self assert: mailA deleted equals: false.
	self assert: mailB seen equals: false.
	self assert: mailB flagged equals: true.
	self assert: mailB deleted equals: false.
	
	"Delete generated files"
	FileDirectory default
		deleteFileNamed: mailAPath;
		deleteFileNamed: mailBPath