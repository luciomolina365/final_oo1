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
			 newDonante: unDonante
			 monto: unMonto
			 mesPago: unMes
			 untipo: unaForma
			 organizacion: unaOrganizacion)
]

{ #category : #accessing }
Coordinador >> calcularIngresosEntre: fecha1 y: fecha2 [

	^ self sumaDeDonaciones: (self donacionesEntre: fecha1 y: fecha2)
]

{ #category : #CasosDeUso }
Coordinador >> consultaDePagos: unDonante [

	^ donaciones select: [ :d | 
		  (d perteneceA: unDonante) & d esDeAnioActual ]
]

{ #category : #accessing }
Coordinador >> donacionesDeDonante: unDonante enOrganizacion: unaOrganizacion [

	^ donaciones select: [ :d | d mismaOrganizacion: unaOrganizacion ]
]

{ #category : #accessing }
Coordinador >> donacionesEntre: fecha1 y: fecha2 [

	| periodo |
	periodo := DateLapse newFechaIni: fecha1 fechaFin: fecha2.

	^ donaciones select: [ :donacion | 
		  periodo includesDate: donacion fecha ]
]

{ #category : #accessing }
Coordinador >> esUnCoordinador [
	^true
]

{ #category : #CasosDeUso }
Coordinador >> ingresosOrganizacionEnMesActual: unaOrganizacion [

	self sumaDeDonaciones: (self todasLasDonacionesEnMesActualDe: unaOrganizacion)
]

{ #category : #private }
Coordinador >> pertenecenAlMesActual: unColeccionDeDonaciones [

	| inicioMes periodo fechaActual |
	fechaActual := Date today.

	inicioMes := Date
		             year: fechaActual year
		             month: fechaActual month
		             day: 1.

	periodo := DateLapse
		           newFechaInicial: inicioMes
		           fechaFinal: fechaActual.

	^ unColeccionDeDonaciones select: [ :donacion | 
		  donacion perteneceAlPeriodo: periodo ]
]

{ #category : #private }
Coordinador >> sumaDeDonaciones: coleccionDeDonaciones [

	^ coleccionDeDonaciones sumNumbers: [ :donacion | donacion montoNeto ]
]

{ #category : #CasosDeUso }
Coordinador >> todasLasDonacionesEnMesActualDe: unaOrganizacion [

	^ self pertenecenAlMesActual:
		  (donaciones select: [ :each | 
			   each mismaOrganizacion: unaOrganizacion ])
]
