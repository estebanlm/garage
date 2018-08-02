Class {
	#name : #GAODBCStatement,
	#superclass : #GAODBCObject,
	#category : #'Garage-ODBC-Driver'
}

{ #category : #'instance creation' }
GAODBCStatement class >> onConnection: aConnection [

	^ self fromHandle: (self sqlAllocHandle: aConnection handle)
]

{ #category : #private }
GAODBCStatement class >> sqlHandleType [ 
	
	^ SQL_HANDLE_STMT
]

{ #category : #'as yet unclassified' }
GAODBCStatement >> execute: aString [ 
	
	self withHandleReturnDo: [ 
		self sqlExecute: aString length: aString size ].
]

{ #category : #'as yet unclassified' }
GAODBCStatement >> sqlExecute: StatementText length: TextLength [

	^ self ffiCall: #(SQLRETURN SQLExecDirect(  
     self,  
     SQLCHAR 		*StatementText,  
     SQLINTEGER   TextLength) )

]
