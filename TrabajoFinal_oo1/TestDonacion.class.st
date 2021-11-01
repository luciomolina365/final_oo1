Class {
	#name : #TestDonacion,
	#superclass : #TestCase,
	#instVars : [
		'donante1',
		'org1',
		'tipo1',
		'donacion1',
		'donante2',
		'org2',
		'tipo2',
		'donacion2',
		'donante3',
		'org3',
		'tipo3',
		'donacion3'
	],
	#category : #'TrabajoFinal_oo1-Tests'
}

{ #category : #running }
TestDonacion >> setUp [

	donante1 := Donante
		            newNombre: 'Carlos Griguol'
		            dni: 22333444
		            telefono: 0012334
		            legajo: '12345/6'
		            email: 'lobo@ee.com'
		            nroDonante: 666.
	org1 := Organizacion
		        newNombre: 'G.Esgrima LP'
		        representante: 'Gerardo'
		        denominacion: 'SRL'
		        direccion: '8 y 50'.
	tipo1 := TransferenciaBancaria new.

	donacion1 := Donacion
		             newDonante: donante1
		             monto: 555
		             mesPago: 12
		             untipo: tipo1
		             organizacion: org1.

	"-------------------------------------------"
	donante2 := Donante
		            newNombre: 'Leandre Mika'
		            dni: 9999999
		            telefono: 001232323
		            legajo: '00001/2'
		            email: 'lobo22@ea.com'
		            nroDonante: 111.
	org2 := Organizacion
		        newNombre: 'Microsoft'
		        representante: 'Bill Gates'
		        denominacion: 'SAA'
		        direccion: 'Nueva Zelanda?'.
	tipo2 := Efectivo new.

	donacion2 := Donacion
		             newDonante: donante2
		             monto: 555
		             mesPago: 11
		             untipo: tipo2
		             organizacion: org2.
	donacion2 fecha: (Date year: 1999 month: 1 day: 1).

	"-------------------------------------------"
	donante3 := Donante
		            newNombre: 'Leandre Mika'
		            dni: 9999999
		            telefono: 001232323
		            legajo: '00001/2'
		            email: 'lobo22@ea.com'
		            nroDonante: 444.
	org3 := Organizacion
		        newNombre: 'IBM'
		        representante: 'Kobe'
		        denominacion: 'SAA'
		        direccion: '122 y 51'.
	tipo3 := PagoFacil new.

	donacion3 := Donacion
		             newDonante: donante3
		             monto: 555
		             mesPago: 11
		             untipo: tipo3
		             organizacion: org3
]

{ #category : #tests }
TestDonacion >> testEsDeOrganizacion [

	self assert: (donacion1 esDeOrganizacion: org1) equals: true.
	self deny: (donacion1 esDeOrganizacion: org2) equals: true.
	
]
