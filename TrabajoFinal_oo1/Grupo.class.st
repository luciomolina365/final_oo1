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

{ #category : #accessing }
Grupo >> donacionesOrganizacion: unaOrganizacion [

	^ self coordinador todasLasDonacionesDe: unaOrganizacion
]

{ #category : #accessing }
Grupo >> donantesOrganizacion: unaOrganizacion [

	^ ((self donacionesOrganizacion: unaOrganizacion) 
	collect: [:donacion | donacion donante ]) asSet
]

{ #category : #accessing }
Grupo >> ingresosEntre: fecha1 y: fecha2 [

	^ self coordinador calcularIngresosEntre: fecha1 y: fecha2
]

{ #category : #initialization }
Grupo >> initialize [

	nroSigDonante := 0.
	organizaciones := OrderedCollection new.
	integrantes := OrderedCollection new
]

{ #category : #accessing }
Grupo >> pagoDonacion: unNroDonante monto: unMonto mes: unMes organizacion: unaOrganizacion tipoPago: unTipoPago [

	| coor donacion |
	(unaOrganizacion existeDonante: unNroDonante) ifFalse: [ 
		^ false "No existe el donante con ese nro" ].

	donacion := Donacion
		            newDonante:
		            (unaOrganizacion donanteConNro: unNroDonante)
		            monto: unMonto
		            mesPago: unMes
		            untipo: unTipoPago
		            organizacion: unaOrganizacion.

	coor := self coordinador.
	coor agregarDonacion: donacion.
	^ true
]
