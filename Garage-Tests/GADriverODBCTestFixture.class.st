Class {
	#name : #GADriverODBCTestFixture,
	#superclass : #GADriverTestFixture,
	#category : #'Garage-Tests'
}

{ #category : #'as yet unclassified' }
GADriverODBCTestFixture >> connection [
	
	^ setupConnection
]

{ #category : #'as yet unclassified' }
GADriverODBCTestFixture >> createDatabase [

	"Nothing"
	| encoding |	
	encoding := self connection encoding = 'utf8' ifTrue: [ 'UTF-8' ] ifFalse: ['UTF-16' ].
	self connection execute: 'PRAGMA encoding = "',encoding,'"'.
]

{ #category : #'as yet unclassified' }
GADriverODBCTestFixture >> createTables [

	self connection execute: 'CREATE TABLE student(
	   id INTEGER,
	   name_surname CHARACTER VARYING(30),	   
	   username VARCHAR(10),
        pass VARCHAR(10),
        mail VARCHAR(50),
        regular BOOLEAN,
	   age SMALLINT,	   
	   average_grade DECIMAL(9,3),
	   sex CHARACTER(3),
	   description CHARACTER VARYING(200),
	   starting_hour TIME,
	   sign_up_date TIMESTAMP,
	   born_date DATE,
	   nullable_field VARCHAR(64) NULL,
	  CONSTRAINT pk_students_id PRIMARY KEY (id)
	)'.
	self connection execute: 'CREATE TABLE signature(
	code INTEGER,
	id_student INTEGER,
	name CHARACTER VARYING(50),
	course_grade INTEGER,
	final_grade INTEGER,
	observations CHARACTER VARYING(255)
)'.
	self connection execute: 'CREATE TABLE course(
	id_course INTEGER,
	id_student INTEGER,
	code_signature INTEGER,
	starting_date DATE,
	CONSTRAINT pk_courses_id_course PRIMARY KEY (id_student, code_signature)
)'.
]

{ #category : #'as yet unclassified' }
GADriverODBCTestFixture >> dropDatabase [

	"We remove the database file"
	self connection isMemory ifFalse: [ self connection database asFileReference delete ].
]

{ #category : #'as yet unclassified' }
GADriverODBCTestFixture >> dropTables [

	self connection execute: 'DROP TABLE course'.
	self connection execute: 'DROP TABLE signature'.
	self connection execute: 'DROP TABLE student'.
]

{ #category : #'as yet unclassified' }
GADriverODBCTestFixture >> newConnection: options [

	"We always create the connection for testing with the same options in sqlite by the moment"
	^ setupConnection
]

{ #category : #'as yet unclassified' }
GADriverODBCTestFixture >> tearDown [

	setupConnection ifNotNil: #close.
	setupConnection := nil.
]
