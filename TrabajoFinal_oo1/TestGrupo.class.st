Class {
	#name : #TestGrupo,
	#superclass : #TestCase,
	#instVars : [
		'coor',
		'donacion1',
		'donante1',
		'org1',
		'grupo1'
	],
	#category : #'TrabajoFinal_oo1-Tests'
}

{ #category : #running }
TestGrupo >> setUp [

	grupo1 := Grupo new.
	grupo1
		altaDonante: 'Carlos Griguol'
		dni: 22333444
		telefono: 0012334
		email: 'lobo@ee.com'
		legajo: '12345/6'.
		
	grupo1
		altaDonante: 'Leandre Mikaliunes'
		dni: 111111111
		telefono: 221888666
		email: 'lobo22@ea.com'
		legajo: '00001/1'.

	grupo1
		altaCoordinador: 'Fernando Palacios'
		dni: 111123
		telefono: 00011231
		legajo: '12345/0'.
	coor := grupo1 coordinador.

	org1 := Organizacion
		        newNombre: 'Microsoft'
		        representante: 'Bill Gates'
		        denominacion: 'SAA'
		        direccion: 'Nueva Zelanda?'.
	grupo1 agregarOrganizacion: org1.
	
	grupo1 altaDeIntegranteEnOrganizacion: 1 organizacion: org1.
	
	donante1 := grupo1 integranteConNro: 1.
]

{ #category : #tests }
TestGrupo >> testAltaDeIntegranteEnOrganizacion [

	self
		assert: (org1 donantes anySatisfy: [ :d | d tieneNro: 2 ])
		equals: false.

	grupo1 altaDeIntegranteEnOrganizacion: 2 organizacion: org1.

	self
		assert: (org1 donantes anySatisfy: [ :d | d tieneNro: 2 ])
		equals: true
]

{ #category : #tests }
TestGrupo >> testAltaDonante [

	self deny: (grupo1 existeIntegrante: 3). 

	grupo1
		altaDonante: 'Miguel Carrasco'  
		dni: 12312312
		telefono: 00011233
		email: 'migue_14@hotmail.com'
		legajo: '12456/9'.
	"En este caso, el integrante tiene un nroDeDonante asignado automaticamente. Al ser el tercero, tiene el 3"
	
	self assert: (grupo1 existeIntegrante: 3).

]

{ #category : #tests }
TestGrupo >> testAltaOrganismo [

	self deny:
		(grupo1 organizaciones anySatisfy: [ :o | o nombre = 'Z.R' ]).

	grupo1
		altaOrganismo: 'Leandre Mikel '
		denominacion: 'SAA'
		direccion: '7 y 56'
		nombre: 'Oscorp'.

	self assert:
		(grupo1 organizaciones anySatisfy: [ :o | o nombre = 'Oscorp' ])
]

{ #category : #tests }
TestGrupo >> testAtenderGastoExtra [

	grupo1 pozoComun: 10.
	grupo1 atenderGastoExtra: 100.
	self assert: grupo1 pozoComun equals: 100.
	
	grupo1 pozoComun: 100.
	self deny: (grupo1 atenderGastoExtra: 100). "No hizo falta solicitar ayuda"
]

{ #category : #tests }
TestGrupo >> testPagoDonacion [

	self deny:
		((coor donacionesDeDonante: donante1 enOrganizacion: org1) 
			 anySatisfy: [ :d | d donante tieneNro: 1 ]).

	grupo1
		pagoDonacion: 1
		monto: 100
		mes: 11
		organizacion: org1
		tipoPago: Efectivo new.

	self assert:
		((coor donacionesDeDonante: donante1 enOrganizacion: org1) 
			 anySatisfy: [ :d | d donante tieneNro: 1 ])
]
