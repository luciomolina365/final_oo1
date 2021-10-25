Class {
	#name : #Organizacion,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'denominacion',
		'representanteLegal',
		'direccion',
		'donantes'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
Organizacion class >> newNombre: unNombre representante: unRepresentante denominacion: unaDenominacion direccion: unaDireccion [

	^ self new
		  nombre: unNombre
		  representante: unRepresentante
		  denominacion: unaDenominacion
		  direccion: unaDireccion
]

{ #category : #CasosDeUso }
Organizacion >> agregarDonante: unDonante [

	"(self existeDonante: unDonante) ifFalse: [ donantes add: unDonante ]"

	donantes add: unDonante
]

{ #category : #accessing }
Organizacion >> denominacion [
^denominacion 
]

{ #category : #accessing }
Organizacion >> direccion [
^direccion
]

{ #category : #private }
Organizacion >> donantes [

	^ donantes
]

{ #category : #private }
Organizacion >> existeDonante: unDonante [

	^ donantes includes: unDonante.
]

{ #category : #initialization }
Organizacion >> initialize [

	donantes := OrderedCollection new
]

{ #category : #accessing }
Organizacion >> nombre [
^nombre
]

{ #category : #private }
Organizacion >> nombre:unNombre representante: unRepresentante denominacion: unaDenominacion direccion: unaDireccion [

	representanteLegal := unRepresentante.
	denominacion := unaDenominacion.
	direccion := unaDireccion.
	nombre:= unNombre
]

{ #category : #accessing }
Organizacion >> representanteLegal [
^representanteLegal
]

{ #category : #accessing }
Organizacion >> verificacionDonante: nroDonante [ 

	(self existeDonante: nroDonante) ifTrue: [ ^ true ].
	^ false
]
