Class {
	#name : #Grupo,
	#superclass : #Object,
	#instVars : [
		'pozoComun',
		'integrantes',
		'coordinadores',
		'organizaciones',
		'nroSigDonante'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #accessing }
Grupo class >> soleInstance [
^soleInstance ifNil:[soleInstance:=self new].
]

{ #category : #private }
Grupo >> agregarCoordinador: unCoordinador [

	coordinadores add: unCoordinador
]

{ #category : #private }
Grupo >> agregarDonacion: unDonante mes: unMes forma: unaForma organizacion: unaOrganizacion monto: unMonto [

	coordinadores do: [ :coordi | 
		coordi
			agregarDonacion: unDonante
			mes: unMes
			forma: unaForma
			organizacion: unaOrganizacion
			monto: unMonto ]
]

{ #category : #private }
Grupo >> agregarIntegrante: unIntegrante [

	integrantes add: unIntegrante
]

{ #category : #private }
Grupo >> agregarOrganizacion: unaOrganizacion [

	organizaciones add: unaOrganizacion
]

{ #category : #accessing }
Grupo >> altaCoordinador: unNombre dni: unDni telefono: unTelefono legajo: unLegajo [

	self agregarCoordinador: (Coordinador
			 newNombre: unNombre
			 dni: unDni
			 telefono: unTelefono
			 legajo: unLegajo)
]

{ #category : #CasosDeUso }
Grupo >> altaDeIntegranteEnOrganizacion: unNroDonante organizacion: unaOrganizacion [

	(self existeIntegrante: unNroDonante) ifTrue: [ 
		unaOrganizacion agregarDonante: (self integranteConNro: unNroDonante) ]


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

{ #category : #CasosDeUso }
Grupo >> altaOrganismo: unRepresentante denominacion: unaDenominacion direccion: unaDireccion nombre:unNombre [

	self agregarOrganizacion: (Organizacion
			 newNombre:unNombre
			 representante: unRepresentante
			 denominacion: unaDenominacion
			 direccion: unaDireccion)
]

{ #category : #private }
Grupo >> coordinador [

	^ coordinadores first
]

{ #category : #CasosDeUso }
Grupo >> donantesEnMesActualDe: unaOrganizacion [

	^ ((self coordinador todasLasDonacionesEnMesActualDe: unaOrganizacion) 
		   collect: [ :donacion | donacion donante ]) asSet
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
	integrantes := OrderedCollection new.
	coordinadores := OrderedCollection new
	
]

{ #category : #private }
Grupo >> integranteConNro: unNroDeDonante [

	^ integrantes detect: [ :d | d tieneNro: unNroDeDonante ]
]

{ #category : #accessing }
Grupo >> integrantes [

	^ integrantes
]

{ #category : #private }
Grupo >> organizaciones [

	^ organizaciones
]

{ #category : #CasosDeUso }
Grupo >> pagoDonacion: unNroDonante monto: unMonto mes: unMes organizacion: unaOrganizacion tipoPago: unTipoPago [

	(unaOrganizacion existeNroDeDonante: unNroDonante) ifFalse: [ 
		^ false ].
	
	self
		agregarDonacion: (self integranteConNro: unNroDonante)
		mes: unMes
		forma: unTipoPago
		organizacion: unaOrganizacion 
		monto: unMonto
]
