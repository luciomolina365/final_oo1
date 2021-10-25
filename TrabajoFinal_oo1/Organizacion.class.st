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

	(self existeNroDeDonante: unDonante nroDonante) ifFalse: [ 
		donantes add: unDonante ]
]

{ #category : #accessing }
Organizacion >> denominacion [
^denominacion 
]

{ #category : #accessing }
Organizacion >> direccion [
^direccion
]

{ #category : #accessing }
Organizacion >> donantes [

	^ donantes
]

{ #category : #accessing }
Organizacion >> existeNroDeDonante: unNroDeDonante [
	
	^ donantes anySatisfy: [ :i | i tieneNro: unNroDeDonante ]
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
