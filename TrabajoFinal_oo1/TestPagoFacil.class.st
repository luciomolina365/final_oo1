Class {
	#name : #TestPagoFacil,
	#superclass : #TestCase,
	#instVars : [
		'medio1'
	],
	#category : #'TrabajoFinal_oo1-Tests'
}

{ #category : #running }
TestPagoFacil >> setUp [

	medio1 := PagoFacil new
]

{ #category : #tests }
TestPagoFacil >> testGastoDeComision [

	| monto |
	monto := 100.


	self assert: (medio1 gastoDeComision: monto) equals: 15
]
