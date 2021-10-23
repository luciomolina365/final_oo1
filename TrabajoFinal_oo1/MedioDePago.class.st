Class {
	#name : #MedioDePago,
	#superclass : #Object,
	#instVars : [
		'monto'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
MedioDePago class >> newMonto:unMonto [
^self new monto:unMonto
]

{ #category : #abstract }
MedioDePago >> gastoDeComision: unPago [

	self subclassResponsibility
]

{ #category : #accessing }
MedioDePago >> monto [
^monto.
]

{ #category : #accessing }
MedioDePago >> monto:unMonto [
monto:=unMonto.
]
