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
	
	org1 := Organizacion
		        newNombre: 'Microsoft'
		        representante: 'Bill Gates'
		        denominacion: 'SAA'
		        direccion: 'Nueva Zelanda?'.
	
	grupo1 agregarOrganizacion: org1.

	
]

{ #category : #tests }
TestGrupo >> testAltaDeIntegranteEnOrganizacion [

	grupo1 altaDeIntegranteEnOrganizacion: 1 organizacion: org1.
	
	self
		assert: (org1 donantes anySatisfy: [ :d | d tieneNro: 1])
		equals: true
]
