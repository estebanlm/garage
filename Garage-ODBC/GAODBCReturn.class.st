Class {
	#name : #GAOdbcReturn,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'SQL_ERROR',
		'SQL_INVALID_HANDLE',
		'SQL_SUCCESS',
		'SQL_SUCCESS_WITH_INFO'
	],
	#category : #'Garage-ODBC-Base'
}

{ #category : #'enum declaration' }
GAOdbcReturn class >> enumDecl [
	^ #(
 SQL_SUCCESS                 0
 SQL_SUCCESS_WITH_INFO       1
 SQL_ERROR                   -1
 SQL_INVALID_HANDLE          -2	
	) 
]

{ #category : #'class initialization' }
GAOdbcReturn class >> initialize [

	self buildClassVariables
]

{ #category : #'accessing enum' }
GAOdbcReturn class >> sqlError [
	"This method was automatically generated"
	^ SQL_ERROR
]

{ #category : #'accessing enum' }
GAOdbcReturn class >> sqlInvalidHandle [
	"This method was automatically generated"
	^ SQL_INVALID_HANDLE
]

{ #category : #'accessing enum' }
GAOdbcReturn class >> sqlSuccess [
	"This method was automatically generated"
	^ SQL_SUCCESS
]

{ #category : #'accessing enum' }
GAOdbcReturn class >> sqlSuccessWithInfo [
	"This method was automatically generated"
	^ SQL_SUCCESS_WITH_INFO
]

{ #category : #testing }
GAOdbcReturn >> isError [
 
	^ self isSuccess not
]

{ #category : #testing }
GAOdbcReturn >> isSuccess [
 
	^ false
]

{ #category : #'as yet unclassified' }
GAOdbcReturn >> verify [ 

	self isSuccess ifTrue: [ ^ self ].
	GAOdbcError signal: 'Error while executing an ODBC command: ', self value asString
]
