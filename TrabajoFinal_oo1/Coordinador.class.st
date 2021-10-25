Class {
	#name : #Coordinador,
	#superclass : #Integrante,
	#instVars : [
		'donaciones'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
Coordinador class >> newNombre: unNombre dni: unDni telefono: unTelefono legajo: unLegajo [

	^ self new
		  nombre: unNombre
		  dni: unDni
		  telefono: unTelefono
		  legajo: unLegajo
]

{ #category : #private }
Coordinador >> agregarDonacion: unaDonacion [
	donaciones add: unaDonacion .
]

{ #category : #accessing }
Coordinador >> agregarDonacion: unDonante mes: unMes forma: unaForma organizacion: unaOrganizacion monto: unMonto [

	self agregarDonacion: (Donacion
			 newDonante: unDonante
			 monto: unMonto
			 mesPago: unMes
			 untipo: unaForma
			 organizacion: unaOrganizacion)
]

{ #category : #accessing }
Coordinador >> calcularIngresosEntre: fecha1 y: fecha2 [

	^ (self donacionesEntre: fecha1 y: fecha2) sumNumbers: [ :d | 
		  d montoNeto ]
]

{ #category : #CasosDeUso }
Coordinador >> consultaDePagos: unDonante [

	^ donaciones select: [ :d | 
		  (d perteneceA: unDonante) & d esDeAnioActual ]
]

{ #category : #private }
Coordinador >> donaciones [

	^ donaciones
]

{ #category : #accessing }
Coordinador >> donacionesDeDonante: unDonante enOrganizacion: unaOrganizacion [

	^ donaciones select: [ :d | 
		  (d esDeOrganizacion: unaOrganizacion) & (d perteneceA: unDonante) ]
]

{ #category : #accessing }
Coordinador >> donacionesEntre: fecha1 y: fecha2 [

	^ donaciones select: [ :donacion | 
		  donacion pertenceAlPeriodo:
			  (DateLapse newFechaIni: fecha1 fechaFin: fecha2) ]
]

{ #category : #CasosDeUso }
Coordinador >> ingresosOrganizacionEnMesActual: unaOrganizacion [

	^ ((self todasLasDonacionesEnMesActualDe: unaOrganizacion) 
		   sumNumbers: [ :donacion | donacion montoNeto ]) asFloat
]

{ #category : #initialization }
Coordinador >> initialize [

 donaciones := OrderedCollection new.
]

{ #category : #CasosDeUso }
Coordinador >> todasLasDonacionesEnMesActualDe: unaOrganizacion [


	^ (donaciones select: [ :each | 
		   each esDeOrganizacion: unaOrganizacion ]) select: [ :d | 
		  d perteneceAlPeriodo: (DateLapse newPeriodoDeMesActual ) ]
]
