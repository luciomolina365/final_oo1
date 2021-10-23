Class {
	#name : #Donacion,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'monto',
		'donante',
		'organizacion',
		'tipo',
		'mesAPagar'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
Donacion class >> newDonacion:unDonante fecha:unaFecha tipo:unTipo organizacion:unaOrganizacion mesAPagar:unMes [
^self new donante:unDonante fecha:unaFecha tipo:unTipo organizacion:unaOrganizacion mesAPagar:unMes
]

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
Donacion >> donante: unDonante fecha: unaFecha tipo: unTipo organizacion: unaOrganizacion mesAPagar:unMes [

	donante := unDonante.
	fecha := unaFecha.
	tipo := unTipo.
	organizacion := unaOrganizacion.
	mesAPagar:=unMes.
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
Donacion >> montoNeto [

	^ monto - (tipo gastoDeComision: monto)
]

{ #category : #accessing }
Donacion >> perteneceA: unDonante [

	^ donante == unDonante

]
