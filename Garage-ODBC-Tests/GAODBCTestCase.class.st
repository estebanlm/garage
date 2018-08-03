Class {
	#name : #GAOdbcTestCase,
	#superclass : #TestCase,
	#instVars : [
		'environment',
		'connection'
	],
	#category : #'Garage-ODBC-Tests'
}

{ #category : #testing }
GAOdbcTestCase class >> isAbstract [

	^ self = GAOdbcTestCase
]

{ #category : #accessing }
GAOdbcTestCase >> connection [

	^ connection ifNil: [ connection := self newTestConnection ]
]

{ #category : #accessing }
GAOdbcTestCase >> environment [

	^ environment ifNil: [ environment := self newTestEnvironment ]
]

{ #category : #'private factory' }
GAOdbcTestCase >> newTestConnection [
	| newConnection |
	
	newConnection := self environment newConnection.
	newConnection 
		connectTo: 'test1' 
		username: '' 
		password: ''.
	
	^ newConnection
]

{ #category : #'private factory' }
GAOdbcTestCase >> newTestEnvironment [
	| newEnvironment |

	newEnvironment := GAOdbcEnvironment allocateEnvironment.
	newEnvironment setODBCVersion3.

	^ newEnvironment
]

{ #category : #'private factory' }
GAOdbcTestCase >> newTestResultSet [

	^ self newTestStatement execute: 'SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE=''BASE TABLE'''.	
]

{ #category : #'private factory' }
GAOdbcTestCase >> newTestStatement [
	
	^ self connection newStatement
]
