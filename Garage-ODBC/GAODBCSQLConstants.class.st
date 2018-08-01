Class {
	#name : #GAODBCSQLConstants,
	#superclass : #SharedPool,
	#classVars : [
		'SQL_HANDLE_DBC',
		'SQL_HANDLE_DESC',
		'SQL_HANDLE_ENV',
		'SQL_HANDLE_STMT'
	],
	#category : #'Garage-ODBC'
}

{ #category : #'class initialization' }
GAODBCSQLConstants class >> initialize [

	self initializeSQLConstants
]

{ #category : #'class initialization' }
GAODBCSQLConstants class >> initializeSQLConstants [

	SQL_HANDLE_ENV 	:= 1.
	SQL_HANDLE_DBC 	:= 2.
	SQL_HANDLE_STMT := 3.
	SQL_HANDLE_DESC := 4
]
