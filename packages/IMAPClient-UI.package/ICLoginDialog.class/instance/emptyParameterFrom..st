as yet unclassified
emptyParameterFrom: aCollection

	| emptyParameters |
	
	emptyParameters := OrderedCollection new.
	
	aCollection keysAndValuesDo: [:key :value |
		(value = nil asString)
			ifTrue: [emptyParameters add: key]].

	^ emptyParameters