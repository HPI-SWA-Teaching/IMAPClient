accessing
getDateInSeconds

	"Use date in header and convert it into seconds with MailMessage timeFrom Method.
	Add localOffset to keep it in LocalTime. 
	Need to add 1.1.1980 because DateAndTime starts there."
	
	self date = '' ifTrue: [^0].
	
	^ (MailMessage new timeFrom: self date) 
		+ (DateAndTime localOffset asSeconds) 
		+ ((Date newDay: 1 year: 1980) asSeconds)