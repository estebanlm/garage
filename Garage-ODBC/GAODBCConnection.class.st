Class {
	#name : #GAOdbcConnection,
	#superclass : #GAOdbcObject,
	#instVars : [
		'environment'
	],
	#category : #'Garage-ODBC-Driver'
}

{ #category : #'instance creation' }
GAOdbcConnection class >> onEnvironment: anEnvironment [

	^ (self fromHandle: (self sqlAllocHandle: anEnvironment handle))
		environment: anEnvironment;
		yourself
]

{ #category : #private }
GAOdbcConnection class >> sqlConnect: handle 
	server: server
	serverLength: serverLength 
	username: username
	usernameLength: usernameLength 
	authentication: auth 
	authenticationSize: authLength [
	
	
]

{ #category : #private }
GAOdbcConnection class >> sqlHandleType [ 
	
	^ SQL_HANDLE_DBC
]

{ #category : #'as yet unclassified' }
GAOdbcConnection >> connectTo: dataSourceName username: aName password: aPassword [

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
GAOdbcConnection >> environment [
	^ environment
]

{ #category : #private }
GAOdbcConnection >> environment: anEnvironment [
	environment := anEnvironment
]

{ #category : #query }
GAOdbcConnection >> execute: aString [

	^ self newStatement execute: aString
]

{ #category : #query }
GAOdbcConnection >> newStatement [

	^ GAOdbcStatement onConnection: self
]

{ #category : #private }
GAOdbcConnection >> sqlConnectTo: ServerName length: NameLength1 
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
