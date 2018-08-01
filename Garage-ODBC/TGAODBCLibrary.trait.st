Trait {
	#name : #TGAODBCLibrary,
	#category : #'Garage-ODBC'
}

{ #category : #'as yet unclassified' }
TGAODBCLibrary classSide >> ffiLibraryName [

	^ GAODBCLibrary
]

{ #category : #'as yet unclassified' }
TGAODBCLibrary >> ffiLibraryName [
	
	^ self class ffiLibraryName
]
