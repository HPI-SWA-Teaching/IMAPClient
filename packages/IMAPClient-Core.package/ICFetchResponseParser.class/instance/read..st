stateTransitions
read: aChar
	|nextTransition|
	nextTransition := ('read', self state asString, ':') asSymbol.
	self perform: nextTransition with: aChar.