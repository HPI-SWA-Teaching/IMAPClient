commands
setFlagFlagged: messageId

	^ {self protocolCommandStart . 'STORE' . messageId . '+FLAGS \Flagged'} joinSeparatedBy: self protocolBlank