accessing
changeAccounts: anAccount

	|foundEndpointIndex foundEndpoint|
	"search endpoint with same name"
	
	anAccount ifNil: [^self].
	
	foundEndpointIndex := self emailAccounts findFirst: [ :endpoint | endpoint name = anAccount string].
	
	foundEndpoint := self emailAccounts at: foundEndpointIndex.
	self getFolderWith: foundEndpoint.
	
	self rootFolder: (Array with: foundEndpoint rootFolder).
	self selectedFolder: nil.
	
	self changed: #selectedFolder.	
	self changed: #rootFolder.
	self changed: #childFolders.
	self changed: #selectedFolder.
	self changed: #emailsOfSelectedFolder

	
		
	 	