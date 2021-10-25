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

{ #category : #accessing }
Grupo class >> soleInstance [
^soleInstance ifNil:[soleInstance:=self new].
]

{ #category : #private }
Grupo >> agregarIntegrante: unIntegrante [

	integrantes add: unIntegrante
]

{ #category : #private }
Grupo >> agregarOrganizacion: unaOrganizacion [

	organizaciones add: unaOrganizacion
]

{ #category : #CasosDeUso }
Grupo >> altaDeIntegranteEnOrganizacion: unNroDonante organizacion: unaOrganizacion [

	(self existeIntegrante: unNroDonante) ifTrue: [ 
		unaOrganizacion agregarDonante: (self integranteConNro: unNroDonante) ]

	"unaOrganizacion agregarDonante: (self integranteConNro: unNroDonante)"
]

{ #category : #CasosDeUso }
Grupo >> altaDeOrganismo: unRepresentante denominacion: unaDenominacion direccion: unaDireccion nombre:unNombre [

	self agregarOrganizacion: (Organizacion
			 newNombre:unNombre
			 representante: unRepresentante
			 denominacion: unaDenominacion
			 direccion: unaDireccion)
]

{ #category : #CasosDeUso }
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

{ #category : #CasosDeUso }
Grupo >> donacionesEnMesActualDe: unaOrganizacion [

	^ self coordinador todasLasDonacionesEnMesActualDe: unaOrganizacion
]

{ #category : #accessing }
Grupo >> donantesEnMesActualDe: unaOrganizacion [

	^ ((self donacionesEnMesActualDe: unaOrganizacion) 
	collect: [:donacion | donacion donante ]) asSet
]

{ #category : #private }
Grupo >> existeIntegrante: unNroDeDonante [

	^ integrantes anySatisfy: [ :i | i tieneNro: unNroDeDonante ]
]

{ #category : #CasosDeUso }
Grupo >> ingresosEntre: fecha1 y: fecha2 [

	^ self coordinador calcularIngresosEntre: fecha1 y: fecha2
]

{ #category : #initialization }
Grupo >> initialize [

	nroSigDonante := 0.
	organizaciones := OrderedCollection new.
	integrantes := OrderedCollection new
]

{ #category : #private }
Grupo >> integranteConNro: unNroDeDonante [

	^ integrantes detect: [ :d | d tieneNro: unNroDeDonante ]
]

{ #category : #private }
Grupo >> organizaciones [

	^ organizaciones
]

{ #category : #CasosDeUso }
Grupo >> pagoDonacion: unNroDonante monto: unMonto mes: unMes organizacion: unaOrganizacion tipoPago: unTipoPago [

	| coor |
	(unaOrganizacion verificacionDonante: unNroDonante) ifFalse: [ 
		^ false ].

	coor := self coordinador.
	coor
		agregarDonacion: (self integranteConNro: unNroDonante)
		mes: unMes
		forma: unTipoPago
		organizacion: self
		monto: unMonto
]
