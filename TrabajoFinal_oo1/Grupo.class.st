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
Grupo >> altaDeOrganismo: unRepresentante denominacion: unaDenominacion direccion: unaDireccion [

	self agregarOrganizacion: (Organizacion
			 newRepresentante: unRepresentante
			 denominacion: unaDenominacion
			 direccion: unaDireccion)
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

{ #category : #private }
Grupo >> coordinador [

	^ integrantes detect: [ :i | i esUnCoordinador ]
]

{ #category : #initialization }
Grupo >> initialize [

	nroSigDonante := 0.
	organizaciones := OrderedCollection new.
	integrantes := OrderedCollection new
]

{ #category : #accessing }
Grupo >> pagoDonacion: unDonante monto: unMonto mes: unMes organizacion: unaOrganizacion tipoPago: unTipoPago [

	| coor donacion |
	(unaOrganizacion existeDonante: unDonante) ifFalse: [ 
		^ false "No existe el donante con ese nro(en esta org)" ].

	donacion := Donacion
		            newDonante: unDonante
		            monto: unMonto
		            mesPago: unMes
		            untipo: unTipoPago
		            organizacion: unaOrganizacion.

	coor := self coordinador.
	coor agregarDonacion: donacion
]
