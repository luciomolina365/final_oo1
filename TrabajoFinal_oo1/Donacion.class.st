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

{ #category : #accessing }
Donacion >> esDeOrganizacion: unaOrganizacion [

	^ organizacion == unaOrganizacion
]

{ #category : #accessing }
Donacion >> fecha [
^fecha
]

{ #category : #private }
Donacion >> fecha: unaFecha [

	fecha := unaFecha
]

{ #category : #accessing }
Donacion >> mesPago [
^mesPago 
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

{ #category : #accessing }
Donacion >> perteneceAlPeriodo: unDateLapse [

	^ unDateLapse includesDate: fecha
]
