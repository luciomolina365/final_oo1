Class {
	#name : #TestTransferenciaBancaria,
	#superclass : #TestCase,
	#instVars : [
		'medio1'
	],
	#category : #'TrabajoFinal_oo1-Tests'
}

{ #category : #running }
TestTransferenciaBancaria >> setUp [

	medio1 := TransferenciaBancaria new
]

{ #category : #tests }
TestTransferenciaBancaria >> testGastoDeComision [

	| monto |
	monto := 100.

	self assert: (medio1 gastoDeComision: monto) equals: 10
]
