Class {
	#name : #GAODBCEnvironment,
	#superclass : #GAODBCObject,
	#category : #'Garage-ODBC'
}

{ #category : #'as yet unclassified' }
GAODBCEnvironment class >> alloc [
	| result handle |
	
	handle := ExternalAddress new.
	result := GAODBCLibrary uniqueInstance 
		allocHandle: SQL_HANDLE_ENV
		input: ExternalAddress null
		output: handle.
	result isSuccess ifFalse: [ 
		GAODBCError signal: 'I can''t create an ODBC environment.' ].
	
	^ self fromHandle: handle
]

{ #category : #finalization }
GAODBCEnvironment class >> finalizeResourceData: handle [

	(handle isNil or: [ handle isNull ]) ifTrue: [ ^ self ].

	^ GAODBCLibrary uniqueInstance
		freeHandleType: SQL_HANDLE_ENV 
		handle: handle
]

{ #category : #initialization }
GAODBCEnvironment >> initialize [
	super initialize.
	self autoRelease
]
