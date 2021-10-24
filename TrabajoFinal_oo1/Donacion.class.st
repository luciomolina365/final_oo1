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

{ #category : #accessing }
Donacion >> donante [

	^ donante
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

{ #category : #private }
Donacion >> fecha [

	^ fecha
]

{ #category : #accessing }
Donacion >> mismaOrganizacion: unaOrganizacion [

	^ organizacion = unaOrganizacion
]

{ #category : #accessing }
Donacion >> montoNeto [

	^ monto - (tipo gastoDeComision: monto)
]

{ #category : #private }
Donacion >> organizacion [

	^ organizacion
]

{ #category : #accessing }
Donacion >> perteneceA: unDonante [

	^ donante == unDonante

]

{ #category : #accessing }
Donacion >> perteneceAlPeriodo: unDateLapse [

	^ unDateLapse includesDate: fecha
]
