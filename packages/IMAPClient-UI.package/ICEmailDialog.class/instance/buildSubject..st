toolbuilder
buildSubject: builder

	^ builder pluggableInputFieldSpec new
		model: self;
		color: #checkBoxColor;
		readOnly: true;
		font: (Preferences standardDefaultTextFont emphasized: 1);
		indicateUnacceptedChanges: false;
		getText: #subject;
		frame: (0 @ 0.0666 extent: 1 @ 0.0666)