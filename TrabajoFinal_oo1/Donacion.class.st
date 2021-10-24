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
Donacion >> enMes:unaFecha [
^((unaFecha monthIndex = fecha monthIndex) & ((fecha subtractDate:unaFecha)<=31)) 

"
f1:=Date today .
f2:=Date today subtractDays: f1 dayOfMonth - 1.
f3:=DateLapse newFechaInicial: f2 fechaFinal:f1.
f4:=Date year: 2021 month: 10 day: 24.

f3 includesDate:f4.
"
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
