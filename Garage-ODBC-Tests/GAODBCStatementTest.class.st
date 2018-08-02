Class {
	#name : #GAODBCStatementTest,
	#superclass : #GAODBCTestCase,
	#category : #'Garage-ODBC-Tests'
}

{ #category : #tests }
GAODBCStatementTest >> testExecute [
	| resultSet |
	
	resultSet := self newStatement execute: 'SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE=''BASE TABLE'''.
	self assert: resultSet notNil.
	self assert: (resultSet isKindOf: GAODBCResultSet)
]
