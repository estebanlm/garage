Class {
	#name : #GAODBCEnvironment,
	#superclass : #GAODBCObject,
	#category : #'Garage-ODBC-Driver'
}

{ #category : #'instance creation' }
GAODBCEnvironment class >> allocateEnvironment [
	
	^ self fromHandle: (self sqlAllocHandle: ExternalAddress null)
]

{ #category : #private }
GAODBCEnvironment class >> sqlHandleType [ 
	
	^ SQL_HANDLE_ENV
]

{ #category : #initialization }
GAODBCEnvironment >> initialize [
	super initialize.
	self autoRelease
]

{ #category : #factory }
GAODBCEnvironment >> newConnection [
	
	^ GAODBCConnection onEnvironment: self
]

{ #category : #accessing }
GAODBCEnvironment >> setAttribute: aName to: aValue [
	
	aValue isInteger ifTrue: [ 
		self withHandleReturnDo: [ 
			^ self sqlSetAttribute: aName toInteger: aValue ]  ].
	aValue isString ifTrue: [ 
		self withHandleReturnDo: [ 
			^ self sqlSetAttribute: aName toString: aValue length: aValue size ] ].
	"horrible, but I need to verify by class :("
	aValue class = ByteArray ifTrue: [ 
		self withHandleReturnDo: [ 
			^ self sqlSetAttribute: aName toBytes: aValue length: aValue size ] ].
	
	self error: 'I don''t know how to set an attribute of type ', aValue className
]

{ #category : #initialization }
GAODBCEnvironment >> setODBCVersion3 [

	^ self 
		setAttribute: SQL_ATTR_ODBC_VERSION
		to: SQL_OV_ODBC3
]

{ #category : #private }
GAODBCEnvironment >> sqlSetAttribute: Attribute toBytes: ValuePtr length: StringLength [
	^ self ffiCall: #(SQLRETURN SQLSetEnvAttr(  
    	self,  
     	SQLINTEGER   Attribute,  
     	SQLPOINTER   ValuePtr,  
     	SQLINTEGER   StringLength))
]

{ #category : #private }
GAODBCEnvironment >> sqlSetAttribute: Attribute toInteger: Value [
	^ self ffiCall: #(SQLRETURN SQLSetEnvAttr(  
    	self,  
     	SQLINTEGER 	Attribute,  
     	uint   		Value,  
		0))
]

{ #category : #private }
GAODBCEnvironment >> sqlSetAttribute: Attribute toString: Value length: StringLength [
	^ self ffiCall: #(SQLRETURN SQLSetEnvAttr(  
    	self,  
     	SQLINTEGER   	Attribute,  
     	String 			Value,  
     	SQLINTEGER   	StringLength))
]
