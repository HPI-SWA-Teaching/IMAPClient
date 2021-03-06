action - freshness
ensureFreshness
	
	" This method is part of a good first issue with no. 366 :)"
	| relevantUIDs localMails min max |
	
	self emails ifEmpty: [^ self].
	
	" we cant use first and last of the sortedCollection because its sorted by date, not by UID "
	min := self lowestUniqueID.
	max := self highestUniqueID.
	
	relevantUIDs := self endpoint currentUIDs select: [ :uid | (uid asNumber <= max) and: [uid asNumber >=min]].

	"search for uids, which are in storage, but not on the server --> they were moved"
	localMails := self emails copy.
	relevantUIDs do: [ :uid | localMails removeAllSuchThat: [ :mail | mail uniqueID = uid]].
	
	"everything left in localMails has changed, and therefore can be removed"
	localMails do: [ :mail | self endpoint deleteMailLocally: mail]