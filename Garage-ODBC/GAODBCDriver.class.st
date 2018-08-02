Class {
	#name : #GAODBCDriver,
	#superclass : #GADriver,
	#instVars : [
		'environment'
	],
	#category : #'Garage-ODBC-Driver'
}

{ #category : #drivers }
GAODBCDriver class >> driverId [

	^ 'odbc'
]

{ #category : #'instance creation' }
GAODBCDriver class >> fromConnectionString: aConnectionString [
	
	^ self new
		connectionString: aConnectionString;
		yourself
]

{ #category : #initialize }
GAODBCDriver class >> initialize [

	self subscribeDriver
]

{ #category : #'as yet unclassified' }
GAODBCDriver class >> newFixture [
	
	^ GADriverODBCTestFixture new
]

{ #category : #testing }
GAODBCDriver class >> supportsEncoding: aString [ 
	
	self flag: #TODO. "Not sure about this, verify"
	^ true
]

{ #category : #initialization }
GAODBCDriver >> initialize [

	super initialize.
	self initializeEnvironment
]

{ #category : #initialization }
GAODBCDriver >> initializeEnvironment [

	environment := self newEnvironment
]

{ #category : #'private factory' }
GAODBCDriver >> newEnvironment [

	^ GAODBCEnvironment allocateEnvironment
]
