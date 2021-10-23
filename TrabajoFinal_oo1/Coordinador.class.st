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
Coordinador >> consultaDePagos: unDonante [

	^ donaciones select: [ :d | 
		  (d perteneceA: unDonante) & d esDeAnioActual ]
]

{ #category : #private }
Coordinador >> esUnCoordinador [
	^true
]
