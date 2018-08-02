Trait {
	#name : #TGAODBCLibrary,
	#category : #'Garage-ODBC-Base'
}

{ #category : #'as yet unclassified' }
TGAODBCLibrary classSide >> ffiLibraryName [

	^ GAODBCLibrary
]

{ #category : #'library path' }
TGAODBCLibrary >> ffiLibraryName [

	^ self class ffiLibraryName
]
