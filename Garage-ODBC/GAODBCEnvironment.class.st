Class {
	#name : #GAOdbcEnvironment,
	#superclass : #GAOdbcObject,
	#category : #'Garage-ODBC-Driver'
}

{ #category : #'instance creation' }
GAOdbcEnvironment class >> allocateEnvironment [
	
	^ self fromHandle: (self sqlAllocHandle: ExternalAddress null)
]

{ #category : #private }
GAOdbcEnvironment class >> sqlHandleType [ 
	
	^ SQL_HANDLE_ENV
]

{ #category : #initialization }
GAOdbcEnvironment >> initialize [
	super initialize.
	self autoRelease
]

{ #category : #factory }
GAOdbcEnvironment >> newConnection [
	
	^ GAOdbcConnection onEnvironment: self
]

{ #category : #accessing }
GAOdbcEnvironment >> setAttribute: aName to: aValue [
	
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
GAOdbcEnvironment >> setODBCVersion3 [

	^ self 
		setAttribute: SQL_ATTR_ODBC_VERSION
		to: SQL_OV_ODBC3
]

{ #category : #private }
GAOdbcEnvironment >> sqlSetAttribute: Attribute toBytes: ValuePtr length: StringLength [
	^ self ffiCall: #(SQLRETURN SQLSetEnvAttr(  
    	self,  
     	SQLINTEGER   Attribute,  
     	SQLPOINTER   ValuePtr,  
     	SQLINTEGER   StringLength))
]

{ #category : #private }
GAOdbcEnvironment >> sqlSetAttribute: Attribute toInteger: Value [
	^ self ffiCall: #(SQLRETURN SQLSetEnvAttr(  
    	self,  
     	SQLINTEGER 	Attribute,  
     	uint   		Value,  
		0))
]

{ #category : #private }
GAOdbcEnvironment >> sqlSetAttribute: Attribute toString: Value length: StringLength [
	^ self ffiCall: #(SQLRETURN SQLSetEnvAttr(  
    	self,  
     	SQLINTEGER   	Attribute,  
     	String 			Value,  
     	SQLINTEGER   	StringLength))
]
