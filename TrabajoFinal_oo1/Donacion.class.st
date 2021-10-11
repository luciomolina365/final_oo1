Class {
	#name : #Donacion,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'monto',
		'donante',
		'organizacion',
		'tipo',
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

	donante := unDonante.
	monto := unMonto.
	fecha := Date today.
	mesPago := unMesPago.
	tipo := unTipo.
	organizacion := unaOrganizacion
]

{ #category : #accessing }
Donacion >> esDeAnioActual [

	^ fecha year = Date today year
]

{ #category : #accessing }
Donacion >> perteneceA: unDonante [

	^ donante == unDonante

]
