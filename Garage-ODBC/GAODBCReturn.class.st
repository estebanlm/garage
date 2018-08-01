Class {
	#name : #GAODBCReturn,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'SQL_ERROR',
		'SQL_INVALID_HANDLE',
		'SQL_SUCCESS',
		'SQL_SUCCESS_WITH_INFO'
	],
	#category : #'Garage-ODBC'
}

{ #category : #'enum declaration' }
GAODBCReturn class >> enumDecl [
	^ #(
 SQL_SUCCESS                 0
 SQL_SUCCESS_WITH_INFO       1
 SQL_ERROR                   -1
 SQL_INVALID_HANDLE          -2	
	) 
]

{ #category : #'class initialization' }
GAODBCReturn class >> initialize [

	self buildClassVariables
]

{ #category : #'accessing enum' }
GAODBCReturn class >> sqlError [
	"This method was automatically generated"
	^ SQL_ERROR
]

{ #category : #'accessing enum' }
GAODBCReturn class >> sqlInvalidHandle [
	"This method was automatically generated"
	^ SQL_INVALID_HANDLE
]

{ #category : #'accessing enum' }
GAODBCReturn class >> sqlSuccess [
	"This method was automatically generated"
	^ SQL_SUCCESS
]

{ #category : #'accessing enum' }
GAODBCReturn class >> sqlSuccessWithInfo [
	"This method was automatically generated"
	^ SQL_SUCCESS_WITH_INFO
]

{ #category : #testing }
GAODBCReturn >> isError [
 
	^ self isSuccess not
]

{ #category : #testing }
GAODBCReturn >> isSuccess [
 
	^ false
]
