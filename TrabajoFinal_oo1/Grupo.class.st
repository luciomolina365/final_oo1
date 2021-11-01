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

{ #category : #'instance creation' }
Grupo class >> newPozoComun:unValor [
^self new pozoComun:unValor.
]

{ #category : #accessing }
Grupo class >> soleInstance [
^soleInstance ifNil:[soleInstance:=self new].
]

{ #category : #accessing }
Grupo class >> soleInstanceWithExample [
soleInstance:=self new example.
]

{ #category : #private }
Grupo >> actualizarPozoComun:unaColeccion [

	pozoComun := pozoComun + (unaColeccion sumNumbers: [ :a | 
		             a montoNeto ])
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

{ #category : #CasosDeUso }
Grupo >> atenderGastoExtra: unGasto [

	| montoASolicitar coor |
	unGasto > pozoComun ifFalse: [ 
		pozoComun := pozoComun - unGasto.
		^ false ].
	"No se necesita ayuda"
	
	integrantes isEmpty ifTrue: [ ^ false ].
	"No hay integrantes a los que solicitar ayuda"

	coor := self coordinador.
	montoASolicitar := (unGasto - pozoComun / integrantes size) asFloat.

	self actualizarPozoComun:
		(self pedirAyudaALosIntegrantes: montoASolicitar).

	^ true
	"Operacion exitosa"
]

{ #category : #accessing }
Grupo >> coordinador [

	^ coordinadores first
]

{ #category : #CasosDeUso }
Grupo >> donantesEnMesActualDe: unaOrganizacion [

	^ ((self coordinador todasLasDonacionesEnMesActualDe: unaOrganizacion) 
		   collect: [ :donacion | donacion donante ]) asSet
]

{ #category : #examples }
Grupo >> example [

	| coor org1 org2 org3 |
self
		altaDonante: 'Carlos Griguol'
		dni: 22333444
		telefono: 0012334
		email: 'lobo@ee.com'
		legajo: '12345/6'.

self 
		altaDonante: 'Leandre Mikaliunes'
		dni: 111111111
		telefono: 221888666
		email: 'lobo22@ea.com'
		legajo: '00001/1'.
		
	self 
		altaDonante: 'Lucio Molina'
		dni: 214567
		telefono: 1254845
		email: 'capo22@ea.com'
		legajo: '00001/0'.
		
	self 
		altaDonante: 'Tobias Ajenjo'
		dni: 5151264
		telefono: 1515151
		email: 'LALAA22@.com'
		legajo: '99999/9'.

	self
		altaCoordinador: 'Fernando Palacios'
		dni: 111123
		telefono: 00011231
		legajo: '12345/0'.
	coor := self coordinador.

	org1 := Organizacion
		        newNombre: 'Microsoft'
		        representante: 'Bill Gates'
		        denominacion: 'SAA'
		        direccion: 'Nueva Zelanda?'.
		
	org2 := Organizacion
		        newNombre: 'Amazon'
		        representante: ' Jeff Bezos'
		        denominacion: 'SAA'
		        direccion: 'USA'.
		
	org3:=Organizacion newNombre: 'Oscorp'
		        representante: ' Jim Carrey'
		        denominacion: 'SAA'
		        direccion: 'New York'. 	


	self agregarOrganizacion: org1.
	self agregarOrganizacion: org2.
	self agregarOrganizacion: org3.
	self altaDeIntegranteEnOrganizacion: 1 organizacion: org1.
	self altaDeIntegranteEnOrganizacion: 2 organizacion: org2.
	self altaDeIntegranteEnOrganizacion: 3 organizacion: org1.
	self altaDeIntegranteEnOrganizacion: 3 organizacion: org2.
	

 	self pagoDonacionTransferenciaBancaria: 1  monto: 555 mes: 11 organizacion: org1.
	self pagoDonacionEfectivo:1 monto:555 mes:12  organizacion: org1.
	self pagoDonacionTransferenciaBancaria: 2  monto: 1000 mes: 11 organizacion: org2.
	self pagoDonacionEfectivo:2 monto:1000 mes:12  organizacion: org2.
	self pagoDonacionPagoFacil:3 monto:5000 mes:12  organizacion: org1.
	self pagoDonacionEfectivo:3 monto:5000 mes:12  organizacion: org2.

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
	coordinadores := OrderedCollection new.
	pozoComun := 0.0
]

{ #category : #private }
Grupo >> integranteConNro: unNroDeDonante [

	^ integrantes detect: [ :d | d tieneNro: unNroDeDonante ]
]

{ #category : #accessing }
Grupo >> integrantes [

	^ integrantes
]

{ #category : #accessing }
Grupo >> organizaciones [
	^organizaciones 
]

{ #category : #private }
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

{ #category : #CasosDeUso }
Grupo >> pagoDonacionEfectivo: unNroDonante monto: unMonto mes: unMes organizacion: unaOrganizacion [

	self
		pagoDonacion: unNroDonante
		monto: unMonto
		mes: unMes
		organizacion: unaOrganizacion
		tipoPago: Efectivo new
]

{ #category : #CasosDeUso }
Grupo >> pagoDonacionPagoFacil: unNroDonante monto: unMonto mes: unMes organizacion: unaOrganizacion [

	self
		pagoDonacion: unNroDonante
		monto: unMonto
		mes: unMes
		organizacion: unaOrganizacion
		tipoPago: PagoFacil new
]

{ #category : #CasosDeUso }
Grupo >> pagoDonacionTransferenciaBancaria: unNroDonante monto: unMonto mes: unMes organizacion: unaOrganizacion [

	self
		pagoDonacion: unNroDonante
		monto: unMonto
		mes: unMes
		organizacion: unaOrganizacion
		tipoPago: TransferenciaBancaria new
]

{ #category : #private }
Grupo >> pedirAyudaALosIntegrantes: unMonto [

	^integrantes collect: [ :i | 
		                     Ayuda
			                     newDonante: i
			                     monto: unMonto
			                     untipo: Efectivo  new ]
]

{ #category : #private }
Grupo >> pozoComun [

	^ pozoComun
]

{ #category : #accessing }
Grupo >> pozoComun:unValor [
pozoComun:=unValor.
]
