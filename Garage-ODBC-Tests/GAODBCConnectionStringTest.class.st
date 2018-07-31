Class {
	#name : #GAODBCConnectionStringTest,
	#superclass : #TestCase,
	#category : #'Garage-ODBC-Tests'
}

{ #category : #tests }
GAODBCConnectionStringTest >> testConnectionString [
	| connectionString driver |

	connectionString := GAConnectionString new
		platform: WinPlatform new;
		initializeFromString: 'odbc://Driver={SQL Server};Server=localhost;Database=test1;';
		yourself.
		
	driver := GAODBCDriver fromConnectionString: connectionString.
	self 
		assert: driver connectionString rawConnectionString
		equals: 'Driver={SQL Server};Server=localhost;Database=test1;'
]
