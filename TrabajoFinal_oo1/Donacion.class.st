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

{ #category : #private }
Donacion >> donante: unDonante fecha: unaFecha tipo: unTipo organizacion: unaOrganizacion mesAPagar:unMes [

	donante := unDonante.
	fecha := unaFecha.
	tipo := unTipo.
	organizacion := unaOrganizacion.
	mesAPagar:=unMes.
]

{ #category : #accessing }
Donacion >> esDeAnioActual [

	^ fecha year == Date today year
]

{ #category : #accessing }
Donacion >> perteneceA: unDonante [

	^ donante == unDonante
	"O PREGUNTO POR SU NRO"
]
