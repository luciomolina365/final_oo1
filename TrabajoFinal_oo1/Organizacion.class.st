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

{ #category : #accessing }
Organizacion >> agregarDonante: unDonante [

	donantes add: unDonante
]

{ #category : #initialization }
Organizacion >> initialize [

	donantes := OrderedCollection new
]
