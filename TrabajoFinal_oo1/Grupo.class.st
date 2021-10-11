Class {
	#name : #Grupo,
	#superclass : #Object,
	#instVars : [
		'pozoComun',
		'integrantes',
		'organizaciones',
		'nroSigDonante'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #private }
Grupo >> agregarIntegrante: unIntegrante [

	integrantes add: unIntegrante
]

{ #category : #private }
Grupo >> agregarOrganizacion: unaOrganizacion [

	organizaciones add: unaOrganizacion
]

{ #category : #accessing }
Grupo >> altaDonante: unNombre dni: unDni telefono: unTelefono email: unEmail legajo: unLegajo [

	nroSigDonante := nroSigDonante + 1.

	self agregarIntegrante: (Donante
			 newNombre: unNombre
			 dni: unDni
			 telefono: unTelefono
			 legajo: unLegajo
			 email: unEmail
			 nroDonante: nroSigDonante)
]

{ #category : #initialization }
Grupo >> initialize [

	nroSigDonante := 0.
	organizaciones := OrderedCollection new.
	integrantes := OrderedCollection new
]
