Class {
	#name : #GAOdbcConnectionTest,
	#superclass : #GAOdbcTestCase,
	#category : #'Garage-ODBC-Tests'
}

{ #category : #tests }
GAOdbcConnectionTest >> testConnectToUsernamePassword [
	| conn |

	conn := self environment newConnection.
	conn 
		connectTo: 'test1'
		username: ''
		password: ''.

	

]

{ #category : #tests }
GAOdbcConnectionTest >> testNewStatement [
	| statement |
	
	statement := self newTestConnection newStatement.
	self assert: statement notNil.
	self deny: statement handle isNull
]
