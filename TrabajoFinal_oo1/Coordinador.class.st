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

{ #category : #accessing }
Coordinador >> agregarDonacion:nroDonante mes:unMes forma:unaForma organizacion:unaOrganizacion fecha:unaFecha [

donaciones add: (Donacion newDonacion:nroDonante fecha:unaFecha  tipo:unaForma  organizacion:unaOrganizacion mesAPagar:unMes)
			 
]

{ #category : #accessing }
Coordinador >> consultaDePagos: unDonante [

	^ donaciones select: [ :d | 
		  (d perteneceA: unDonante) & d esDeAnioActual ]
]
