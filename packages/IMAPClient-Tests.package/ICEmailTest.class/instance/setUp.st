running
setUp

	self email: (ICEmail new
		body: '';
		subject: 'subject text';
		from: 'Sender <sender@address.de>';
		to: 'receiver';
		contentType: 'text/plain; charset=ISO-8859-1';
		contentTransferEncoding: 'base64';
		date: 'Fri, 10 Jun 2016 12:51:42 +0200')