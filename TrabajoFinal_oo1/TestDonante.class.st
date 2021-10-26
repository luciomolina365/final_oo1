Class {
	#name : #TestDonante,
	#superclass : #TestCase,
	#instVars : [
		'org1',
		'donante1',
		'donante2'
	],
	#category : #'TrabajoFinal_oo1-Tests'
}

{ #category : #running }
TestDonante >> setUp [

	donante1 := Donante
		            newNombre: 'Leandre Mikaliunes'
		            dni: 9999999
		            telefono: 001232323
		            legajo: '00001/2'
		            email: 'lobo22@ea.com'
		            nroDonante: 111
]

{ #category : #tests }
TestDonante >> testTieneNro [

	self assert: (donante1 tieneNro: 111).
	self deny: (donante1 tieneNro: 666)
]
