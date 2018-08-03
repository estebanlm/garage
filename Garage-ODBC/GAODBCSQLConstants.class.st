Class {
	#name : #GAOdbcSqlConstants,
	#superclass : #SharedPool,
	#classVars : [
		'SQL_ATTR_ODBC_VERSION',
		'SQL_HANDLE_DBC',
		'SQL_HANDLE_DESC',
		'SQL_HANDLE_ENV',
		'SQL_HANDLE_STMT',
		'SQL_OV_ODBC2',
		'SQL_OV_ODBC3'
	],
	#category : #'Garage-ODBC-Base'
}

{ #category : #'class initialization' }
GAOdbcSqlConstants class >> initialize [

	self initializeSQLConstants
]

{ #category : #'class initialization' }
GAOdbcSqlConstants class >> initializeSQLConstants [

	SQL_HANDLE_ENV 	:= 1.
	SQL_HANDLE_DBC 	:= 2.
	SQL_HANDLE_STMT := 3.
	SQL_HANDLE_DESC := 4.
	
	SQL_ATTR_ODBC_VERSION  	:= 200.
	SQL_OV_ODBC2 				:= 2.
	SQL_OV_ODBC3 				:= 3.
]
