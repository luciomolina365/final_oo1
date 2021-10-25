Class {
	#name : #TestCoordinador,
	#superclass : #TestCase,
	#instVars : [
		'donante1',
		'donante2',
		'donante3',
		'org1',
		'org2',
		'coor',
		'donacion1',
		'donacion2',
		'donacion3',
		'donacion4',
		'aux',
		'aux2',
		'aux3'
	],
	#category : #'TrabajoFinal_oo1-Tests'
}

{ #category : #running }
TestCoordinador >> setUp [

	coor := Coordinador
		        newNombre: 'Menem'
		        dni: 111
		        telefono: 221555666
		        legajo: '00001/8'.

	donante1 := Donante
		            newNombre: 'Carlos Griguol'
		            dni: 22333444
		            telefono: 0012334
		            legajo: '12345/6'
		            email: 'lobo@ee.com'
		            nroDonante: 666.
	donante2 := Donante
		            newNombre: 'Leandre Mika'
		            dni: 9999999
		            telefono: 001232323
		            legajo: '00001/2'
		            email: 'lobo22@ea.com'
		            nroDonante: 111.
	donante3 := Donante
		            newNombre: 'Ricardo Fort'
		            dni: 678678
		            telefono: 09809
		            legajo: '001231/2'
		            email: 'asdasd@ea.com'
		            nroDonante: 333.

	org1 := Organizacion
		        newNombre: 'Microsoft'
		        representante: 'Bill Gates'
		        denominacion: 'SAA'
		        direccion: 'Nueva Zelanda?'.
	org2 := Organizacion
		        newNombre: 'Karitas'
		        representante: 'Milei'
		        denominacion: 'SRL'
		        direccion: '520 y 180'.

	org1 agregarDonante: donante3.
	org1 agregarDonante: donante1.

	org2 agregarDonante: donante2.
	org2 agregarDonante: donante3.

	donacion1 := Donacion
		             newDonante: donante3
		             monto: 500
		             mesPago: 11
		             untipo: Efectivo new
		             organizacion: org1.
	coor agregarDonacion: donacion1.

	donacion2 := Donacion
		             newDonante: donante3
		             monto: 1000
		             mesPago: 11
		             untipo: PagoFacil new
		             organizacion: org2.
	coor agregarDonacion: donacion2.

	donacion3 := Donacion
		             newDonante: donante1
		             monto: 500
		             mesPago: 11
		             untipo: TransferenciaBancaria new
		             organizacion: org1.
	coor agregarDonacion: donacion3.

	donacion4 := Donacion
		             newDonante: donante2
		             monto: 1000
		             mesPago: 11
		             untipo: PagoFacil new
		             organizacion: org2.
	coor agregarDonacion: donacion4.

	aux := OrderedCollection new.
	aux add: donacion1.
	aux add: donacion2.
	aux2 := OrderedCollection new.
	aux2 add: donacion1.
	aux2 add: donacion3.
	aux3 := OrderedCollection new.
	aux3 add: donacion2.
	aux3 add: donacion4.
	
]

{ #category : #tests }
TestCoordinador >> testConsultaDePagos [


	self
		assert: (coor consultaDePagos: donante3)
		equals: aux asOrderedCollection.

	self
		deny: (coor consultaDePagos: donante1)
		equals: aux asOrderedCollection.

]

{ #category : #tests }
TestCoordinador >> testIngresosOrganizacionEnMesActual [

	self assert: (coor ingresosOrganizacionEnMesActual: org1) equals: 950.

	donacion1 fecha: (Date year: 2021 month: 9 day: 30). "Cambiamos la fecha de una de las donaciones"

	self deny: (coor ingresosOrganizacionEnMesActual: org1) equals: 950.
]

{ #category : #tests }
TestCoordinador >> testTodasLasDonacionesEnMesActualDe [

	self
		assert: (coor todasLasDonacionesEnMesActualDe: org1)
		equals: aux2 asOrderedCollection.

	self
		assert: (coor todasLasDonacionesEnMesActualDe: org2)
		equals: aux3 asOrderedCollection
		
	
]
