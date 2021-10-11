Class {
	#name : #Organizacion,
	#superclass : #Object,
	#instVars : [
		'denominacion',
		'representanteLegal',
		'direccion',
		'donantes'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
Organizacion class >> newRepresentante: unRepresentante denominacion: unaDenominacion direccion: unaDireccion [

	^ self new
		  representante: unRepresentante
		  denominacion: unaDenominacion
		  direccion: unaDireccion
]

{ #category : #accessing }
Organizacion >> agregarDonante: unDonante [

	(self existeDonante: unDonante) ifFalse: [ donantes add: unDonante ]
]

{ #category : #private }
Organizacion >> donanteConNro: unNroDeDonante [

	^ donantes detect: [ :d | d tieneNro: unNroDeDonante ]
]

{ #category : #private }
Organizacion >> existeDonante: unDonante [

	^ donantes includes: unDonante.
]

{ #category : #initialization }
Organizacion >> initialize [

	donantes := OrderedCollection new
]

{ #category : #private }
Organizacion >> representante: unRepresentante denominacion: unaDenominacion direccion: unaDireccion [

	representanteLegal := unRepresentante.
	denominacion := unaDenominacion.
	direccion := unaDireccion.
	
]
