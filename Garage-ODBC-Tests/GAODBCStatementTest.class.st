Class {
	#name : #GAOdbcStatementTest,
	#superclass : #GAOdbcTestCase,
	#category : #'Garage-ODBC-Tests'
}

{ #category : #tests }
GAOdbcStatementTest >> testExecute [
	| resultSet statement |
	
	statement := self newTestStatement.
	resultSet := statement execute: 'SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE=''BASE TABLE'''.
	self assert: resultSet notNil.
	self assert: (resultSet isKindOf: GAOdbcResultSet).
	
	self 
		should: [ 
			statement execute: 'SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE=''BASE TABLE''' ] 
		raise: GAOdbcError
]

{ #category : #tests }
GAOdbcStatementTest >> testIsExecuted [
	| statement resultSet |
	
	statement := self newTestStatement.
	self deny: statement isExecuted.
	resultSet := statement execute: 'SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE=''BASE TABLE'''.
	self assert: statement isExecuted
]
