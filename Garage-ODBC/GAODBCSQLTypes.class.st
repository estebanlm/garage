Class {
	#name : #GAOdbcSqlTypes,
	#superclass : #SharedPool,
	#classVars : [
		'HDBC',
		'HENV',
		'HSTMT',
		'LDOUBLE',
		'PTR',
		'RETCODE',
		'SCHAR',
		'SDOUBLE',
		'SDWORD',
		'SFLOAT',
		'SLONG',
		'SQLCHAR',
		'SQLDATE',
		'SQLDECIMAL',
		'SQLDOUBLE',
		'SQLFLOAT',
		'SQLHANDLE',
		'SQLHDBC',
		'SQLHDESC',
		'SQLHENV',
		'SQLHSTMT',
		'SQLINTEGER',
		'SQLNUMERIC',
		'SQLPOINTER',
		'SQLREAL',
		'SQLRETURN',
		'SQLSCHAR',
		'SQLSMALLINT',
		'SQLTIME',
		'SQLTIMESTAMP',
		'SQLUINTEGER',
		'SQLUSMALLINT',
		'SQLVARCHAR',
		'SSHORT',
		'SWORD',
		'UCHAR',
		'UDWORD',
		'ULONG',
		'USHORT',
		'UWORD'
	],
	#category : #'Garage-ODBC-Base'
}

{ #category : #'class initialization' }
GAOdbcSqlTypes class >> initialize [
	self initializeODBCTypes
]

{ #category : #'class initialization' }
GAOdbcSqlTypes class >> initializeODBCTypes [

	SQLCHAR	:=	#uchar.
	SQLSCHAR	:=	#char.
	SQLDATE	:=	#uchar.
	SQLDECIMAL	:=	#uchar.
	SQLDOUBLE	:=	#double.
	SQLFLOAT	:=	#double.
	SQLINTEGER	:=	#long.
	SQLUINTEGER	:=	#ulong.
	SQLUSMALLINT	:=	#uint64.
	SQLNUMERIC	:=	#uchar.
	SQLPOINTER	:=	#'void *'.
	SQLREAL	:=	#float.
	SQLSMALLINT	:=	#short.
	SQLUSMALLINT	:=	#ushort.
	SQLTIME	:=	#uchar.
	SQLTIMESTAMP	:=	#uchar.
	SQLVARCHAR	:=	#uchar.
	SQLRETURN	:=	#GAOdbcReturn.
	SQLHANDLE	:=	#'void *'.
	SQLHENV 	:=	#SQLHANDLE.
	SQLHDBC	:=	#SQLHANDLE.
	SQLHSTMT	:=	#SQLHANDLE.
	SQLHDESC	:=	#SQLHANDLE.
	UCHAR	:=	#uchar.
	SCHAR	:=	#char.
	SQLSCHAR	:=	#SCHAR.
	SDWORD	:=	#long.
	SWORD	:=	#short.
	UDWORD	:=	#ulong.
	UWORD	:=	#ushort.
	SQLUINTEGER	:=	#UDWORD.
	SLONG	:=	#long.
	SSHORT	:=	#short.
	ULONG	:=	#ulong.
	USHORT	:=	#ushort.
	SDOUBLE	:=	#double.
	LDOUBLE	:=	#double.
	SFLOAT	:=	#float.
	PTR	:=	#'void *'.
	HENV	:=	#'void *'.
	HDBC	:=	#'void *'.
	HSTMT	:=	#'void *'.
	RETCODE 	:=	#short.
]
