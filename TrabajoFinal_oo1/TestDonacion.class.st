Class {
	#name : #TestDonacion,
	#superclass : #TestCase,
	#instVars : [
		'donacion1',
		'donante1',
		'tipo1',
		'org1',
		'org2'
	],
	#category : #'TrabajoFinal_oo1-Tests'
}

{ #category : #running }
TestDonacion >> setUp [

donante1 := Donante newNombre: 'Carlos Griguol' dni: 22333444 telefono: 0012334 legajo: '12345/6' email:'lobo@ee.com'  nroDonante: 666.
tipo1 := TransferenciaBancaria new.
org1 := Organizacion newNombre: 'G.Esgrima LP' representante: 'Gerardo'  denominacion:'SRL' direccion: '8 y 50'.

donacion1 := Donacion newDonante: donante1 monto: 555 mesPago: 12 untipo: tipo1 organizacion: org1 .

org2 := Organizacion newNombre: 'Microsoft' representante: 'Bill Gates'  denominacion:'SAA' direccion: 'Nueva Zelanda?'.
]

{ #category : #accessing }
TestDonacion >> testEsDeAnioActual [

	self assert: donacion1 esDeAnioActual equals: true.
	"La fecha se asigna en la creacion de la instacia"
	
	donacion1 fecha: (Date year: 1999 month: 9 day: 9).
	self assert: donacion1 esDeAnioActual equals: false.
	
	donacion1 fecha: (Date year: 2021 month: 9 day: 9).
	self assert: donacion1 esDeAnioActual equals: true.
]

{ #category : #tests }
TestDonacion >> testMismaOrganizacion [

	self assert: (donacion1 mismaOrganizacion: org1) equals: true.
	self deny: (donacion1 mismaOrganizacion: org2) equals: true.
	
]

{ #category : #tests }
TestDonacion >> testMontoNeto [

self assert: (donacion1 montoNeto) equals: 499.5.

"Falllllta"
]

{ #category : #tests }
TestDonacion >> testPerteneceAlPeriodo [

	| d |
	d := DateLapse newFechaIni: '1999/09/02' fechaFin: '2003/09/10'.
	self deny: [ donacion1 perteneceAlPeriodo: d ].
	d := DateLapse newFechaIni: '1999/09/02' fechaFin: '3000/12/11'.
	self assert: [ donacion1 perteneceAlPeriodo: d ]
]
