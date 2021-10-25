Class {
	#name : #TestGrupo,
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
		'org3',
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
		altaCoordinador: 'Fernando Palacios'
		dni: 111123
		telefono: 00011231
		legajo: '12345/0'.

	org1 := Organizacion
		        newNombre: 'Microsoft'
		        representante: 'Bill Gates'
		        denominacion: 'SAA'
		        direccion: 'Nueva Zelanda?'.

	grupo1 agregarOrganizacion: org1
]

{ #category : #tests }
TestGrupo >> testAltaDeIntegranteEnOrganizacion [

	self
		assert: (org1 donantes anySatisfy: [ :d | d tieneNro: 1 ])
		equals: false.

	grupo1 altaDeIntegranteEnOrganizacion: 1 organizacion: org1.

	self
		assert: (org1 donantes anySatisfy: [ :d | d tieneNro: 1 ])
		equals: true
]

{ #category : #tests }
TestGrupo >> testAltaDeOrganismo [

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
TestGrupo >> testAltaDonante [

	self deny: (grupo1 existeIntegrante: 2). 

	grupo1
		altaDonante: 'Miguel Carrasco'  
		dni: 12312312
		telefono: 00011233
		email: 'migue_14@hotmail.com'
		legajo: '12456/9'.
	"En este caso, el integrante tiene un nroDeDonante asignado automaticamente. Al ser el segundo, tiene el 2"
	
	self assert: (grupo1 existeIntegrante: 2).

]

{ #category : #tests }
TestGrupo >> testDonacionesEnMesActualDe [

	self assert: false equals: true
	
	
	"asdasdasdasd"
]

{ #category : #tests }
TestGrupo >> testIngresosEntre [

	self assert: false equals: true


	"asdasdasdasd"
]

{ #category : #tests }
TestGrupo >> testPagoDonacion [

	| coor donante aux |
	coor := grupo1 coordinador.
	donante := grupo1 integranteConNro: 1. "Coordinador no entiende este MSJ"
	grupo1 altaDeIntegranteEnOrganizacion: 1 organizacion: org1.

	self deny:
		((coor donacionesDeDonante: donante enOrganizacion: org1) 
			 anySatisfy: [ :d | d donante tieneNro: 1 ]).

	grupo1
		agregarDonacion: donante
		mes: '5'
		forma: Efectivo new
		organizacion: org1
		monto: 123.

	self assert:
		((coor donacionesDeDonante: donante enOrganizacion: org1) 
			 anySatisfy: [ :d | d donante tieneNro: 1 ])
]
