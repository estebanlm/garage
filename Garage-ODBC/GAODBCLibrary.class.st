Class {
	#name : #GAODBCLibrary,
	#superclass : #FFILibrary,
	#pools : [
		'GAODBCSQLConstants',
		'GAODBCSQLTypes'
	],
	#category : #'Garage-ODBC'
}

{ #category : #'as yet unclassified' }
GAODBCLibrary >> allocHandle: HandleType input: InputHandle output: OutputHandlePtr [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle(  
      SQLSMALLINT   HandleType,  
      SQLHANDLE     InputHandle,  
      SQLHANDLE *   OutputHandlePtr))
]

{ #category : #'as yet unclassified' }
GAODBCLibrary >> freeHandleType: HandleType handle: handle [

	^ self ffiCall: #(SQLRETURN SQLFreeHandle(  
     SQLSMALLINT   HandleType,  
     SQLHANDLE     Handle))
]

{ #category : #'accessing platform' }
GAODBCLibrary >> win32ModuleName [ 
	^ 'odbc32.dll'
]
