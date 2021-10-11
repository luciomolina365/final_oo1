Class {
	#name : #Coordinador,
	#superclass : #Integrante,
	#instVars : [
		'donaciones'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
Coordinador class >> newNombre:unNombre dni:unDni telefono:unTelefono legajo:unLegajo [ 
^self newNombre: unNombre  dni:unDni  telefono:unTelefono  legajo:unLegajo. 
 
]

{ #category : #'as yet unclassified' }
Coordinador >> consultaDePagos: unDonante [

	^ donaciones collect: [ :d | 
		  (d perteneceA: unDonante) & d esDeAnioActual ]
]
