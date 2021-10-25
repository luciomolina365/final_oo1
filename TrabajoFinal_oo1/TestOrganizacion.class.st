Class {
	#name : #TestOrganizacion,
	#superclass : #TestCase,
	#instVars : [
		'org1',
		'donante1',
		'donante2'
	],
	#category : #'TrabajoFinal_oo1-Tests'
}

{ #category : #running }
TestOrganizacion >> setUp [

	donante1 := Donante
		            newNombre: 'Leandre Mikaliunes'
		            dni: 9999999
		            telefono: 001232323
		            legajo: '00001/2'
		            email: 'lobo22@ea.com'
		            nroDonante: 111.

	donante2 := Donante
		            newNombre: 'Tobi Quispe'
		            dni: 123123
		            telefono: 00999666
		            legajo: '00001/2'
		            email: 'CABJ@boca.com'
		            nroDonante: 666.

	org1 := Organizacion
		        newNombre: 'Karitas'
		        representante: 'Bill Gates'
		        denominacion: 'ONG'
		        direccion: 'Nueva Zelanda?'.
		
	org1 agregarDonante: donante1
]

{ #category : #tests }
TestOrganizacion >> testAgregarDonante [

	self deny: (org1 existeNroDeDonante: donante2 nroDonante).
	
	org1 agregarDonante: donante2.
	
	self assert: (org1 existeNroDeDonante: donante2 nroDonante).
	
	
]

{ #category : #tests }
TestOrganizacion >> testExisteNroDeDonante [

	self assert: (org1 existeNroDeDonante: 111).
	self deny: (org1 existeNroDeDonante: 666).
]
