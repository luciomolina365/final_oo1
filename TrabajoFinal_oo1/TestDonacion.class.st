Class {
	#name : #TestDonacion,
	#superclass : #TestCase,
	#instVars : [
		'donacion1',
		'donante1',
		'tipo1',
		'org1',
		'donacion2',
		'donante2',
		'tipo2',
		'org2',
		'donacion3',
		'donante3',
		'tipo3',
		'org3'
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
		            nroDonante: 111.
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
TestDonacion >> testEsDeOrganizacion [

	self assert: (donacion1 esDeOrganizacion: org1) equals: true.
	self deny: (donacion1 esDeOrganizacion: org2) equals: true.
	
]

{ #category : #tests }
TestDonacion >> testMontoNeto [

	self assert: donacion1 montoNeto equals: 499.5. "TransferenciaBancaria 10%"
	self assert: donacion2 montoNeto equals: 555. "Efectivo 0%"
	self assert: donacion3 montoNeto equals: 471.75 "PagoFacil 15%"
]

{ #category : #tests }
TestDonacion >> testPerteneceA [

	self assert: (donacion1 perteneceA: donante1 ).
	self deny: (donacion1 perteneceA: donante2 ).
	
]

{ #category : #tests }
TestDonacion >> testPerteneceAlPeriodo [

	| d |
	d := DateLapse newFechaIni: '1999/09/02' fechaFin: '2003/09/10'.
	self deny: [ donacion1 perteneceAlPeriodo: d ]. "Fecha de hoy"
	self deny: [ donacion2 perteneceAlPeriodo: d ]. "1999/1/1"
	d := DateLapse newFechaIni: '1999/09/02' fechaFin: '3000/12/11'.
	self assert: [ donacion1 perteneceAlPeriodo: d ]. "Fecha de hoy"
	self deny: [ donacion2 perteneceAlPeriodo: d ] "1999/1/1"
]
