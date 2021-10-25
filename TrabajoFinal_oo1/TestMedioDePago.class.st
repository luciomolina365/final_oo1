Class {
	#name : #TestMedioDePago,
	#superclass : #TestCase,
	#instVars : [
		'org1',
		'donante1',
		'donante2',
		'medio1',
		'medio2',
		'medio3'
	],
	#category : #'TrabajoFinal_oo1-Tests'
}

{ #category : #running }
TestMedioDePago >> setUp [

	medio1 := Efectivo new.
	medio2 := TransferenciaBancaria new.
	medio3 := PagoFacil new
]

{ #category : #tests }
TestMedioDePago >> testGastoDeComision [

	| monto |
	monto := 100.

	self assert: (medio1 gastoDeComision: monto) equals: 0.
	self assert: (medio2 gastoDeComision: monto) equals: 10.
	self assert: (medio3 gastoDeComision: monto) equals: 15
]
