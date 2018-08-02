Class {
	#name : #GAODBCLibrary,
	#superclass : #FFILibrary,
	#pools : [
		'GAODBCSQLConstants',
		'GAODBCSQLTypes'
	],
	#category : #'Garage-ODBC-Base'
}

{ #category : #allocating }
GAODBCLibrary >> sqlAllocHandle: HandleType input: InputHandle output: OutputHandlePtr [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle(  
      SQLSMALLINT   HandleType,  
      SQLHANDLE     InputHandle,  
      SQLHANDLE *   OutputHandlePtr))
]

{ #category : #allocating }
GAODBCLibrary >> sqlFreeHandleType: HandleType handle: handle [

	^ self ffiCall: #(SQLRETURN SQLFreeHandle(  
     SQLSMALLINT   HandleType,  
     SQLHANDLE     Handle))
]

{ #category : #'accessing platform' }
GAODBCLibrary >> win32ModuleName [ 
	^ 'odbc32.dll'
]
