Class {
	#name : #PagoFacil,
	#superclass : #MedioDePago,
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #abstract }
PagoFacil >> gastoDeComision: unPago [

	^ (unPago / 100 * 15) asFloat
]
