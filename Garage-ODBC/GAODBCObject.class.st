Class {
	#name : #GAOdbcObject,
	#superclass : #FFIOpaqueObject,
	#traits : 'TGAOdbcLibrary',
	#classTraits : 'TGAOdbcLibrary classTrait',
	#pools : [
		'GAOdbcSqlConstants',
		'GAOdbcSqlTypes'
	],
	#category : #'Garage-ODBC-Base'
}

{ #category : #'as yet unclassified' }
GAOdbcObject class >> ffiLibraryName [

	^ GAOdbcLibrary
]

{ #category : #finalization }
GAOdbcObject class >> finalizeResourceData: handle [

	(handle isNil or: [ handle isNull ]) ifTrue: [ ^ self ].

	^ GAOdbcLibrary uniqueInstance
		sqlFreeHandleType: self sqlHandleType 
		handle: handle
]

{ #category : #private }
GAOdbcObject class >> sqlAllocHandle: inputHandle [
	| newHandle |

	newHandle := ExternalAddress new.
	GAOdbcLibrary uniqueInstance 
		sqlAllocHandle: self sqlHandleType
		input: inputHandle 
		output: newHandle.
	
	^ newHandle
]

{ #category : #private }
GAOdbcObject class >> sqlHandleType [ 
	
	^ self subclassResponsibility
		
]

{ #category : #enumerating }
GAOdbcObject >> withHandleReturnDo: aBlock [

	aBlock value verify
	
]
