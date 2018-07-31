Extension { #name : #GADriver }

{ #category : #'*Garage-Tests' }
GADriver class >> newFixture [

	^ self subclassResponsibility
]

{ #category : #'*Garage-Tests' }
GADriver class >> newFixtureForConnectionString: aConnectionString [

	^ self newFixture
]
