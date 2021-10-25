Class {
	#name : #Integrante,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'dni',
		'telefono',
		'legajo'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
Integrante class >> newNombre:unNombre dni:unDni telefono:unTelefono legajo:unLegajo [
^self new nombre:unNombre dni:unDni telefono:unTelefono legajo:unLegajo
 
]

{ #category : #accessing }
Integrante >> dni [
^dni
]

{ #category : #accessing }
Integrante >> esUnCoordinador [

	self subclassResponsibility
]

{ #category : #accessing }
Integrante >> legajo [
^legajo
]

{ #category : #accessing }
Integrante >> nombre [ 
^nombre
]

{ #category : #private }
Integrante >> nombre: unNombre dni: unDni telefono: unTelefono legajo: unLegajo [

	nombre := unNombre.
	dni := unDni.
	telefono := unTelefono.
	legajo := unLegajo
]

{ #category : #accessing }
Integrante >> telefono [
^telefono 
]
