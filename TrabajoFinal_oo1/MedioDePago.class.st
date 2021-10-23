Class {
	#name : #MedioDePago,
	#superclass : #Object,
	#instVars : [
		'monto'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #abstract }
MedioDePago >> gastoDeComision: unPago [

	self subclassResponsibility
]
