Class {
	#name : #Coordinador,
	#superclass : #Integrante,
	#instVars : [
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
Coordinador >> agregarDonacion: unDonante mes:unMes forma:unaForma organizacion:unaOrganizacion [ 

donaciones add: (Donacion newDonacion: unDonante monto: (unaForma monto) mesPago:unMes untipo:unaForma  organizacion:unaOrganizacion)


]

{ #category : #accessing }
Coordinador >> calculoIngresos:fecha1 y:fecha2 [
|aux enFecha|
aux:= DateLapse newFechaIni: fecha1 fechaFin:fecha2.
enFecha:=donaciones select: [:donacion | aux includesDate:(donacion fecha)].
^enFecha sumNumbers:[:donacion|donacion monto]
]

{ #category : #accessing }
Coordinador >> consultaDePagos: unDonante [

	^ donaciones select: [ :d | 
		  (d perteneceA: unDonante) & d esDeAnioActual ]
]

{ #category : #private }
Coordinador >> esUnCoordinador [
	^true
]
