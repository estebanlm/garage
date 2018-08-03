Class {
	#name : #GAOdbcStatement,
	#superclass : #GAOdbcObject,
	#instVars : [
		'executed',
		'resultSet'
	],
	#category : #'Garage-ODBC-Driver'
}

{ #category : #'instance creation' }
GAOdbcStatement class >> onConnection: aConnection [

	^ self fromHandle: (self sqlAllocHandle: aConnection handle)
]

{ #category : #private }
GAOdbcStatement class >> sqlHandleType [ 
	
	^ SQL_HANDLE_STMT
]

{ #category : #executing }
GAOdbcStatement >> execute: aString [ 
	executed ifTrue: [ 
		^ GAOdbcError signal: 'This statement was already executed. Reset it before using it again.' ].
	
	self withHandleReturnDo: [ 
		self sqlExecute: aString length: aString size ].
	executed := true.

	^ resultSet := GAOdbcResultSet onStatement: self
]

{ #category : #initialization }
GAOdbcStatement >> initialize [
	super initialize.
	executed := false
]

{ #category : #testing }
GAOdbcStatement >> isExecuted [

	^ executed
]

{ #category : #accessing }
GAOdbcStatement >> reset [
	executed := false.
	resultSet reset
]

{ #category : #private }
GAOdbcStatement >> sqlExecute: StatementText length: TextLength [

	^ self ffiCall: #(SQLRETURN SQLExecDirect(  
     self,  
     SQLCHAR 		*StatementText,  
     SQLINTEGER   TextLength) )

]
