Class {
	#name : #TransferenciaBancaria,
	#superclass : #MedioDePago,
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #abstract }
TransferenciaBancaria >> gastoDeComision: unPago [

	^ unPago / 100 * 10
]
