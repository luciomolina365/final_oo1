Class {
	#name : #Donacion,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'monto',
		'donante',
		'organizacion',
		'tipo'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
Donacion class >> newDonante:unDonante fecha:unaFecha tipo:unTipo organizacion:unaOrganizacion [
^self new donante:unDonante fecha:unaFecha tipo:unTipo organizacion:unaOrganizacion 
]

{ #category : #accessing }
Donacion >> donante: unDonante fecha: unaFecha tipo: unTipo organizacion: unaOrganizacion [

	donante := unDonante.
	fecha := unaFecha.
	tipo := unTipo.
	organizacion := unaOrganizacion
]
