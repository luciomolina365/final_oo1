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

{ #category : #private }
Integrante >> nombre: unNombre dni: unDni telefono: unTelefono legajo: unLegajo [

	nombre := unNombre.
	dni := unDni.
	telefono := unTelefono.
	legajo := unLegajo
]
