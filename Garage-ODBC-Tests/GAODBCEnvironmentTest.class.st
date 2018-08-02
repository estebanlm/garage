Class {
	#name : #GAODBCEnvironmentTest,
	#superclass : #TestCase,
	#category : #'Garage-ODBC-Tests'
}

{ #category : #tests }
GAODBCEnvironmentTest >> testAllocateEnvironment [
	| environment |
	
	environment := GAODBCEnvironment allocateEnvironment.
	self deny: environment handle isNil.
	self deny: environment handle isNull
]

{ #category : #tests }
GAODBCEnvironmentTest >> testSetAttribute [
	"smoke test of set attribute. If it passes, it works ;)"
	| environment |
	
	environment := GAODBCEnvironment allocateEnvironment.
	
	"this will execute a set odbc version to 3"
	environment setAttribute: 200 to: 3
]
