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
Donacion class >> newDonacion: unDonante monto: unMonto mesPago: unMesPago untipo: unTipo organizacion: unaOrganizacion [

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

{ #category : #'as yet unclassified' }
Donacion >> enFecha: unaOrderedCollection [

	| inicioMes periodo fechaActual |
	fechaActual:=Date today.
	(fechaActual day = 1) ifTrue: [ inicioMes := fechaActual subtractDays: fechaActual dayOfMonth] ifFalse: [ inicioMes := fechaActual subtractDays: fechaActual dayOfMonth - 1. ].
	

	periodo := DateLapse newFechaInicial: inicioMes fechaFinal: fechaActual.
	^ unaOrderedCollection select: [ :donacion | donacion enMes: periodo ]
]

{ #category : #'as yet unclassified' }
Donacion >> enMes:unDateLapse [
	^ unDateLapse includesDate: fecha

]

{ #category : #accessing }
Donacion >> esDeAnioActual [

	^ fecha year = Date today year
]

{ #category : #accessing }
Donacion >> fecha [
^fecha 
]

{ #category : #'as yet unclassified' }
Donacion >> mismaOrganizacion:unaOrganizacion [
^(organizacion = unaOrganizacion) 
]

{ #category : #accessing }
Donacion >> montoNeto [

	^ monto - (tipo gastoDeComision: monto)
]

{ #category : #accessing }
Donacion >> organizacion [
^organizacion 
]

{ #category : #accessing }
Donacion >> perteneceA: unDonante [

	^ donante == unDonante

]
