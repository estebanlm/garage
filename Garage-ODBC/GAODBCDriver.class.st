Class {
	#name : #GAOdbcDriver,
	#superclass : #GADriver,
	#instVars : [
		'environment'
	],
	#category : #'Garage-ODBC-Driver'
}

{ #category : #drivers }
GAOdbcDriver class >> driverId [

	^ 'odbc'
]

{ #category : #'instance creation' }
GAOdbcDriver class >> fromConnectionString: aConnectionString [
	
	^ self new
		connectionString: aConnectionString;
		yourself
]

{ #category : #initialize }
GAOdbcDriver class >> initialize [

	self subscribeDriver
]

{ #category : #'as yet unclassified' }
GAOdbcDriver class >> newFixture [
	
	^ GADriverOdbcTestFixture new
]

{ #category : #testing }
GAOdbcDriver class >> supportsEncoding: aString [ 
	
	self flag: #TODO. "Not sure about this, verify"
	^ true
]

{ #category : #initialization }
GAOdbcDriver >> initialize [

	super initialize.
	self initializeEnvironment
]

{ #category : #initialization }
GAOdbcDriver >> initializeEnvironment [

	environment := self newEnvironment
]

{ #category : #'private factory' }
GAOdbcDriver >> newEnvironment [

	^ GAOdbcEnvironment allocateEnvironment
]
