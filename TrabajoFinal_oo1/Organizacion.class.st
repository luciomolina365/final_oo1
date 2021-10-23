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
Organizacion >> pagoDonacion:nroDonante mes:unMes forma:unaForma cordinador:unCordinador [

unCordinador agregarDonacion:nroDonante mes:unMes forma:unaForma organizacion:self fecha:Date today.
"esto sera llamado solo por el cordinador"
]

{ #category : #accessing }
Organizacion >> pagoEfectivo:nroDonante mes:unMes cordinador:unCordinador [

self pagoDonacion:nroDonante  mes:unMes  forma:(Efectivo new)  cordinador:unCordinador
]

{ #category : #accessing }
Organizacion >> pagoFacil:nroDonante mes:unMes cordinador:unCordinador [

self pagoDonacion:nroDonante  mes:unMes  forma:(PagoFacil new)  cordinador:unCordinador
]

{ #category : #private }
Organizacion >> representante: unRepresentante denominacion: unaDenominacion direccion: unaDireccion [

	representanteLegal := unRepresentante.
	denominacion := unaDenominacion.
	direccion := unaDireccion.
	
]

{ #category : #accessing }
Organizacion >> transferenciaBancaria:nroDonante mes:unMes cordinador:unCordinador [

self pagoDonacion:nroDonante  mes:unMes  forma:(TransferenciaBancaria new)  cordinador:unCordinador
]
