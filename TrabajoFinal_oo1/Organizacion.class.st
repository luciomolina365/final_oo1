Class {
	#name : #Organizacion,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'denominacion',
		'representanteLegal',
		'direccion',
		'donantes'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
Organizacion class >> newNombre: unNombre representante: unRepresentante denominacion: unaDenominacion direccion: unaDireccion [

	^ self new
		  nombre: unNombre
		  representante: unRepresentante
		  denominacion: unaDenominacion
		  direccion: unaDireccion
]

{ #category : #accessing }
Organizacion >> agregarDonante: unDonante [

	(self existeDonante: unDonante) ifFalse: [ donantes add: unDonante ]
]

{ #category : #private }
Organizacion >> donanteConNro: unNroDeDonante [

	^ donantes detect: [ :d | d tieneNro: unNroDeDonante ]
]

{ #category : #private }
Organizacion >> existeDonante: unDonante [

	^ donantes includes: unDonante.
]

{ #category : #initialization }
Organizacion >> initialize [

	donantes := OrderedCollection new
]

{ #category : #private }
Organizacion >> nombre:unNombre representante: unRepresentante denominacion: unaDenominacion direccion: unaDireccion [

	representanteLegal := unRepresentante.
	denominacion := unaDenominacion.
	direccion := unaDireccion.
	nombre:= unNombre
]

{ #category : #accessing }
Organizacion >> pagoDonacion: unDonante mes: unMes forma: unaForma coordinador: unCoordinador monto: unMonto [

	unCoordinador
		agregarDonacion: unDonante
		mes: unMes
		forma: unaForma
		organizacion: self
		monto: unMonto
	"esto sera llamado solo por el coordinador"
]

{ #category : #accessing }
Organizacion >> pagoEfectivo: nroDonante mes: unMes monto: unMonto cordinador: unCordinador [

	self
		verificacionDonante: nroDonante
		mes: unMes
		forma: (Efectivo new)
		cordinador: unCordinador
		monto:unMonto.
]

{ #category : #accessing }
Organizacion >> pagoFacil: nroDonante mes: unMes monto: unMonto cordinador: unCordinador [

	self
		verificacionDonante: nroDonante
		mes: unMes
		forma: (PagoFacil new)
		cordinador: unCordinador
		monto:unMonto
]

{ #category : #accessing }
Organizacion >> transferenciaBancaria: nroDonante mes: unMes monto: unMonto cordinador: unCordinador [ 

	self
		verificacionDonante: nroDonante
		mes: unMes
		forma: (TransferenciaBancaria new)
		cordinador: unCordinador
		monto:unMonto
]

{ #category : #accessing }
Organizacion >> verificacionDonante: nroDonante mes: unMes forma: unaForma cordinador: unCordinador monto:unMonto [

	(self existeDonante: nroDonante)
		ifTrue: [ 
			self
				pagoDonacion: (self donanteConNro:nroDonante)
				mes: unMes
				forma: unaForma
				coordinador: unCordinador
				monto:unMonto ]
		ifFalse: [ ^ false ]
	"aca se devolvera en pantalla q primero debe estar registrado en el sistema de la organizacion"
]
