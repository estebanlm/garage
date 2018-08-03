Trait {
	#name : #TGAOdbcLibrary,
	#category : #'Garage-ODBC-Base'
}

{ #category : #'as yet unclassified' }
TGAOdbcLibrary classSide >> ffiLibraryName [

	^ GAOdbcLibrary
]

{ #category : #'library path' }
TGAOdbcLibrary >> ffiLibraryName [

	^ self class ffiLibraryName
]
