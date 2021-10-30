Class {
	#name : #Donacion,
	#superclass : #Ayuda,
	#instVars : [
		'organizacion',
		'mesPago'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
Donacion class >> newDonante: unDonante monto: unMonto mesPago: unMesPago untipo: unTipo organizacion: unaOrganizacion [

	^ self new
		  donante: unDonante
		  monto: unMonto
		  mesPago: unMesPago
		  untipo: unTipo
		  organizacion: unaOrganizacion
]

{ #category : #private }
Donacion >> donante: unDonante monto: unMonto mesPago: unMesPago untipo: unTipo organizacion: unaOrganizacion [

	self donante: unDonante monto: unMonto untipo: unTipo.
	mesPago := unMesPago.
	organizacion := unaOrganizacion
]

{ #category : #accessing }
Donacion >> esDeOrganizacion: unaOrganizacion [

	organizacion ifNil: [ ^ false ].
	^ organizacion == unaOrganizacion
]

{ #category : #accessing }
Donacion >> mesPago [
^mesPago 
]

{ #category : #accessing }
Donacion >> organizacion [
^organizacion 
]
