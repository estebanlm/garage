Class {
	#name : #GAOdbcResultSet,
	#superclass : #GAOdbcObject,
	#instVars : [
		'statement'
	],
	#category : #'Garage-ODBC-Driver'
}

{ #category : #'instance creation' }
GAOdbcResultSet class >> new [
	self error: 'Use #onStatement:'
]

{ #category : #'instance creation' }
GAOdbcResultSet class >> onStatement: aStatement [
	
	^ self basicNew 
		initializeStatement: aStatement;
		yourself
]

{ #category : #initialization }
GAOdbcResultSet >> initializeStatement: aStatement [
	
	self initialize.
	statement := aStatement.
	self setHandle: statement handle
]
