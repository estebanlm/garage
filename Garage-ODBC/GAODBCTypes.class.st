Class {
	#name : #GAODBCTypes,
	#superclass : #SharedPool,
	#category : #'Garage-ODBC'
}

{ #category : #initialization }
GAODBCTypes class >> initialize [
	self initializeODBCTypes
]

{ #category : #initialization }
GAODBCTypes class >> initializeODBCTypes [

	SQLSMALLINT	:= #short.
	SQLUSMALLINT := #ushort.
	SQLINTEGER := #long.
	SQLUINTEGER	:= #ulong.
	SQLREAL := #float.
	SQLDOUBLE := SQLFLOAT	:= #double.
	SQLSCHAR	:= #char.
	SQLCHAR := #uchar.
	"SQLWCHAR := 'wchar_t'."
]

{ #category : #'as yet unclassified' }
GAODBCTypes >> initialize [
	self initializeODBCTypes
]

{ #category : #initialization }
GAODBCTypes >> initializeODBCTypes [

	SQLSMALLINT	:= #short.
	SQLUSMALLINT := #ushort.
	SQLINTEGER := #long.
	SQLUINTEGER	:= #ulong.
	SQLREAL := #float.
	SQLDOUBLE := SQLFLOAT	:= #double.
	SQLSCHAR	:= #char.
	SQLCHAR := #uchar.
	"SQLWCHAR := 'wchar_t'."
]
