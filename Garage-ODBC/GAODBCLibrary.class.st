Class {
	#name : #GAODBCLibrary,
	#superclass : #FFILibrary,
	#category : #'Garage-ODBC'
}

{ #category : #'accessing platform' }
GAODBCLibrary >> win32ModuleName [ 
	^ 'odbc.dll'
]
