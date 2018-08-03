Class {
	#name : #GAOdbcLibrary,
	#superclass : #FFILibrary,
	#pools : [
		'GAOdbcSqlConstants',
		'GAOdbcSqlTypes'
	],
	#category : #'Garage-ODBC-Base'
}

{ #category : #allocating }
GAOdbcLibrary >> sqlAllocHandle: HandleType input: InputHandle output: OutputHandlePtr [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle(  
      SQLSMALLINT   HandleType,  
      SQLHANDLE     InputHandle,  
      SQLHANDLE *   OutputHandlePtr))
]

{ #category : #allocating }
GAOdbcLibrary >> sqlFreeHandleType: HandleType handle: handle [

	^ self ffiCall: #(SQLRETURN SQLFreeHandle(  
     SQLSMALLINT   HandleType,  
     SQLHANDLE     Handle))
]

{ #category : #'accessing platform' }
GAOdbcLibrary >> win32ModuleName [ 
	^ 'odbc32.dll'
]
