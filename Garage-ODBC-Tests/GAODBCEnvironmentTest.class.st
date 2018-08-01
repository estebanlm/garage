Class {
	#name : #GAODBCEnvironmentTest,
	#superclass : #TestCase,
	#category : #'Garage-ODBC-Tests'
}

{ #category : #tests }
GAODBCEnvironmentTest >> testAlloc [
	| environment |
	
	environment := GAODBCEnvironment alloc.
	self deny: environment handle isNil.
	self deny: environment handle isNull.
	
]
