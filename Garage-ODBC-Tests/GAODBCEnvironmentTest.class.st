Class {
	#name : #GAOdbcEnvironmentTest,
	#superclass : #TestCase,
	#category : #'Garage-ODBC-Tests'
}

{ #category : #tests }
GAOdbcEnvironmentTest >> testAllocateEnvironment [
	| environment |
	
	environment := GAOdbcEnvironment allocateEnvironment.
	self deny: environment handle isNil.
	self deny: environment handle isNull
]

{ #category : #tests }
GAOdbcEnvironmentTest >> testSetAttribute [
	"smoke test of set attribute. If it passes, it works ;)"
	| environment |
	
	environment := GAOdbcEnvironment allocateEnvironment.
	
	"this will execute a set odbc version to 3"
	environment setAttribute: 200 to: 3
]
