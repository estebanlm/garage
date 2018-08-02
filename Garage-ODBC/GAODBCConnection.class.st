Class {
	#name : #GAODBCConnection,
	#superclass : #GAODBCObject,
	#instVars : [
		'environment'
	],
	#category : #'Garage-ODBC-Driver'
}

{ #category : #'instance creation' }
GAODBCConnection class >> onEnvironment: anEnvironment [

	^ (self fromHandle: (self sqlAllocHandle: anEnvironment handle))
		environment: anEnvironment;
		yourself
]

{ #category : #private }
GAODBCConnection class >> sqlConnect: handle 
	server: server
	serverLength: serverLength 
	username: username
	usernameLength: usernameLength 
	authentication: auth 
	authenticationSize: authLength [
	
	
]

{ #category : #private }
GAODBCConnection class >> sqlHandleType [ 
	
	^ SQL_HANDLE_DBC
]

{ #category : #'as yet unclassified' }
GAODBCConnection >> connectTo: dataSourceName username: aName password: aPassword [

	self withHandleReturnDo: [ 
		self 
			sqlConnectTo: dataSourceName
			length: dataSourceName size 
			username: aName 
			length: aName size 
			authentication: aPassword 
			length: aPassword size ]
]

{ #category : #accessing }
GAODBCConnection >> environment [
	^ environment
]

{ #category : #accessing }
GAODBCConnection >> environment: anObject [
	environment := anObject
]

{ #category : #query }
GAODBCConnection >> execute: aString [

	^ self newStatement execute: aString
]

{ #category : #query }
GAODBCConnection >> newStatement [

	^ GAODBCStatement onConnection: self
]

{ #category : #private }
GAODBCConnection >> sqlConnectTo: ServerName length: NameLength1 
	username: UserName length: NameLength2 
	authentication: Authentication length: NameLength3 [

	^ self ffiCall: #(SQLRETURN SQLConnect(  
     self,  
     SQLCHAR *      ServerName,  
     SQLSMALLINT    NameLength1,  
     SQLCHAR *      UserName,  
     SQLSMALLINT    NameLength2,  
     SQLCHAR *      Authentication,  
     SQLSMALLINT    NameLength3))
]
