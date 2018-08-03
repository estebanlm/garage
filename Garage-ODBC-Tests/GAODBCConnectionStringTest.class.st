Class {
	#name : #GAOdbcConnectionStringTest,
	#superclass : #TestCase,
	#category : #'Garage-ODBC-Tests'
}

{ #category : #tests }
GAOdbcConnectionStringTest >> testConnectionString [
	| connectionString driver |

	connectionString := GAConnectionString new
		platform: WinPlatform new;
		initializeFromString: 'odbc://Driver={SQL Server};Server=localhost;Database=test1;';
		yourself.
		
	driver := GAOdbcDriver fromConnectionString: connectionString.
	self 
		assert: driver connectionString rawConnectionString
		equals: 'Driver={SQL Server};Server=localhost;Database=test1;'
]
