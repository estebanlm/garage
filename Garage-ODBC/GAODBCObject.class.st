Class {
	#name : #GAODBCObject,
	#superclass : #FFIOpaqueObject,
	#traits : 'TGAODBCLibrary',
	#classTraits : 'TGAODBCLibrary classTrait',
	#pools : [
		'GAODBCSQLConstants',
		'GAODBCSQLTypes'
	],
	#category : #'Garage-ODBC-Base'
}

{ #category : #finalization }
GAODBCObject class >> finalizeResourceData: handle [

	(handle isNil or: [ handle isNull ]) ifTrue: [ ^ self ].

	^ GAODBCLibrary uniqueInstance
		sqlFreeHandleType: self sqlHandleType 
		handle: handle
]

{ #category : #private }
GAODBCObject class >> sqlAllocHandle: inputHandle [
	| newHandle |

	newHandle := ExternalAddress new.
	GAODBCLibrary uniqueInstance 
		sqlAllocHandle: self sqlHandleType
		input: inputHandle 
		output: newHandle.
	
	^ newHandle
]

{ #category : #private }
GAODBCObject class >> sqlHandleType [ 
	
	^ self subclassResponsibility
		
]

{ #category : #enumerating }
GAODBCObject >> withHandleReturnDo: aBlock [

	aBlock value verify
	
]
