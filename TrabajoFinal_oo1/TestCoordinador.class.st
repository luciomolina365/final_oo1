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
		'aux3',
		'fecha1',
		'fecha2',
		'aux4',
		'aux5',
		'fecha3',
		'donante4'
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
		
	donante4 := Donante
		            newNombre: 'Lionel Messi'
		            dni: 3453423
		            telefono: 0009234
		            legajo: '23/2'
		            email: 'barca@ea.com'
		            nroDonante: 222.

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
	org1 agregarDonante: donante4.

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

	fecha1 := Date year: 2020 month: 1 day: 1.
	fecha2 := Date year: 2022 month: 1 day: 1.
	fecha3 := Date year: 2019 month: 1 day: 1.

	aux4 := OrderedCollection new.
	aux4 add: donacion1.
	aux4 add: donacion2.
	aux4 add: donacion3.
	aux4 add: donacion4.

	aux5 := OrderedCollection new.
	aux5 add: donacion2.
	aux5 add: donacion3.
	aux5 add: donacion4.
]

{ #category : #'as yet unclassified' }
TestCoordinador >> testAgregarDonacion [

	self assert: coor donaciones size equals: 4.

	coor
		agregarDonacion: donante4
		mes: 6
		forma: Efectivo new
		organizacion: org1
		monto: 666.

	self assert: coor donaciones size equals: 5.

	self assert:
		(coor donaciones anySatisfy: [ :d | d perteneceA: donante4 ])
]

{ #category : #tests }
TestCoordinador >> testCalcularIngresosEntre [

	self
		assert: (coor calcularIngresosEntre: fecha1 y: fecha2)
		equals: 2650. "La fecha de las donaciones se asigna cuando se crea."

	self 
		assert: (coor calcularIngresosEntre: fecha3 y: fecha1) 
		equals: 0 "Rango de fechas sin donaciones"
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
TestCoordinador >> testDonacionesDeDonanteEnOrganizacion [

	self
		assert: (coor donacionesDeDonante: donante3 enOrganizacion: org1)
		equals: donacion1 asOrderedCollection.
	self
		deny: (coor donacionesDeDonante: donante3 enOrganizacion: org1)
		equals: aux. "Comprobamos que sean solo las destinadas a esa organizacion"

	self assert:
		(coor donacionesDeDonante: donante1 enOrganizacion: org2) isEmpty 
		"Comprobamos cuando no hay donaciones que cumplan con la condicion"
]

{ #category : #tests }
TestCoordinador >> testDonacionesEntre [

	self
		assert: (coor donacionesEntre: fecha1 y: fecha2)
		equals: aux4 asOrderedCollection.

	donacion1 fecha: (Date year: 2019 month: 9 day: 30).
	"Cambiamos la fecha de una de las donaciones"
	
	self
		assert: (coor donacionesEntre: fecha1 y: fecha2)
		equals: aux5 asOrderedCollection

	
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
