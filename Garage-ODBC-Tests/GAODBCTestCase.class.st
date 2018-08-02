Class {
	#name : #GAODBCTestCase,
	#superclass : #TestCase,
	#instVars : [
		'environment',
		'connection'
	],
	#category : #'Garage-ODBC-Tests'
}

{ #category : #testing }
GAODBCTestCase class >> isAbstract [

	^ self = GAODBCTestCase
]

{ #category : #accessing }
GAODBCTestCase >> connection [

	^ connection ifNil: [ connection := self newConnection ]
]

{ #category : #accessing }
GAODBCTestCase >> environment [

	^ environment ifNil: [ environment := self newEnvironment ]
]

{ #category : #'private factory' }
GAODBCTestCase >> newConnection [
	| newConnection |
	
	newConnection := self environment newConnection.
	newConnection 
		connectTo: 'test1' 
		username: '' 
		password: ''.
	
	^ newConnection
]

{ #category : #'private factory' }
GAODBCTestCase >> newEnvironment [
	| newEnvironment |

	newEnvironment := GAODBCEnvironment allocateEnvironment.
	newEnvironment setODBCVersion3.

	^ newEnvironment
]

{ #category : #'private factory' }
GAODBCTestCase >> newStatement [
	
	^ self connection newStatement
]
