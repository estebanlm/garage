Class {
	#name : #GAODBCDriver,
	#superclass : #GADriver,
	#category : #'Garage-ODBC'
}

{ #category : #drivers }
GAODBCDriver class >> driverId [

	^ 'odbc'
]

{ #category : #'instance creation' }
GAODBCDriver class >> fromConnectionString: aConnectionString [
	
	^ self new
		database: aConnectionString database;
		yourself
]

{ #category : #initialize }
GAODBCDriver class >> initialize [

	self subscribeDriver
]

{ #category : #testing }
GAODBCDriver class >> supportsEncoding: aString [ 
	
	self flag: #TODO. "Not sure about this, verify"
	^ true
]

{ #category : #'as yet unclassified' }
GAODBCDriver >> initializeConnectionString: aConnectionString [
	self initialize.
	
	
]
