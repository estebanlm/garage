Class {
	#name : #GAODBCConnectionTest,
	#superclass : #GAODBCTestCase,
	#category : #'Garage-ODBC-Tests'
}

{ #category : #tests }
GAODBCConnectionTest >> testConnectToUsernamePassword [
	| connection |

	connection := self environment newConnection.
	connection 
		connectTo: 'test1'
		username: ''
		password: ''.

	

]

{ #category : #tests }
GAODBCConnectionTest >> testNewStatement [
	| statement |
	
	statement := self newConnection newStatement.
	self assert: statement notNil.
	self deny: statement handle isNull
]
