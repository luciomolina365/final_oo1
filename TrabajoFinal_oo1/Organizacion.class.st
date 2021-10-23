Class {
	#name : #Organizacion,
	#superclass : #Object,
	#instVars : [
		'denominacion',
		'representanteLegal',
		'direccion',
		'donantes'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
Organizacion class >> newRepresentante: unRepresentante denominacion: unaDenominacion direccion: unaDireccion [

	^ self new
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

{ #category : #accessing }
Organizacion >> pagoDonacion: unDonante mes: unMes forma: unaForma cordinador: unCordinador [

	unCordinador
		agregarDonacion: unDonante 
		mes: unMes
		forma: unaForma
		organizacion: self
	"esto sera llamado solo por el cordinador"
]

{ #category : #accessing }
Organizacion >> pagoEfectivo: nroDonante mes: unMes monto: unMonto cordinador: unCordinador [

	self
		verificacionDonante: nroDonante
		mes: unMes
		forma: (Efectivo newMonto: unMonto)
		cordinador: unCordinador
]

{ #category : #accessing }
Organizacion >> pagoFacil: nroDonante mes: unMes monto: unMonto cordinador: unCordinador [

	self
		verificacionDonante: nroDonante
		mes: unMes
		forma: (PagoFacil newMonto: unMonto)
		cordinador: unCordinador
]

{ #category : #private }
Organizacion >> representante: unRepresentante denominacion: unaDenominacion direccion: unaDireccion [

	representanteLegal := unRepresentante.
	denominacion := unaDenominacion.
	direccion := unaDireccion.
	
]

{ #category : #accessing }
Organizacion >> transferenciaBancaria:nroDonante mes:unMes monto:unMonto cordinador:unCordinador [

self verificacionDonante:nroDonante  mes:unMes  forma:(TransferenciaBancaria newMonto:unMonto)  cordinador:unCordinador
]

{ #category : #accessing }
Organizacion >> verificacionDonante: nroDonante mes: unMes forma: unaForma cordinador: unCordinador [

	(self existeDonante: nroDonante)
		ifTrue: [ 
			self
				pagoDonacion: (self donanteConNro:nroDonante)
				mes: unMes
				forma: unaForma
				cordinador: unCordinador ]
		ifFalse: [ ^ false ]
	"aca se devolvera en pantalla q primero debe estar registrado en el sistema de la organizacion"
]
