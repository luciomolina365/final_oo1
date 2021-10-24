Class {
	#name : #Coordinador,
	#superclass : #Integrante,
	#classVars : [
		'donaciones'
	],
	#classInstVars : [
		'donaciones'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #accessing }
Coordinador class >> agregarDonacion: unaDonacion [
	donaciones add: unaDonacion .
]

{ #category : #'instance creation' }
Coordinador class >> newNombre:unNombre dni:unDni telefono:unTelefono legajo:unLegajo [ 
^self newNombre: unNombre  dni:unDni  telefono:unTelefono  legajo:unLegajo. 
 
]

{ #category : #accessing }
Coordinador >> agregarDonacion: unDonante mes: unMes forma: unaForma organizacion: unaOrganizacion monto:unMonto [

	donaciones agregarDonacion: (Donacion
			 newDonacion: unDonante
			 monto: unMonto
			 mesPago: unMes
			 untipo: unaForma
			 organizacion: unaOrganizacion)
]

{ #category : #accessing }
Coordinador >> calculoIngresos: fecha1 y: fecha2 [

^ self sumaDeDonaciones: (self donacionesEntre: fecha1 y: fecha2)
]

{ #category : #accessing }
Coordinador >> consultaDePagos: unDonante [

	^ donaciones select: [ :d | 
		  (d perteneceA: unDonante) & d esDeAnioActual ]
]

{ #category : #accessing }
Coordinador >> donacionesEntre: fecha1 y: fecha2 [

	| periodo donacionesEnFecha |
	periodo := DateLapse newFechaIni: fecha1 fechaFin: fecha2.
	donacionesEnFecha := donaciones select: [ :donacion | 
		                     periodo includesDate: donacion fecha ].
	^ donacionesEnFecha
]

{ #category : #private }
Coordinador >> esUnCoordinador [
	^true
]

{ #category : #private }
Coordinador >> sumaDeDonaciones: donacionesEnFecha [

	^ donacionesEnFecha sumNumbers: [ :donacion | donacion montoNeto ]
]

{ #category : #'as yet unclassified' }
Coordinador >> todasDonaciones:unaOrganizacion [ 

|orga|
orga:= donaciones select: [:each|each mismaOrganizacion:unaOrganizacion ].
orga select:[:each|each enMes ]


]
