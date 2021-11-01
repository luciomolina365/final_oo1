Class {
	#name : #TestEfectivo,
	#superclass : #TestCase,
	#instVars : [
		'medio1'
	],
	#category : #'TrabajoFinal_oo1-Tests'
}

{ #category : #running }
TestEfectivo >> setUp [

	medio1 := Efectivo new.
]

{ #category : #tests }
TestEfectivo >> testGastoDeComision [

	| monto |
	monto := 100.

	self assert: (medio1 gastoDeComision: monto) equals: 0.

]
