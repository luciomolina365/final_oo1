Class {
	#name : #TestDonacion,
	#superclass : #TestCase,
	#category : #'TrabajoFinal_oo1-Tests'
}

{ #category : #running }
TestDonacion >> setUp [
|donacion1 donante1 tipo1 org1|
donante1 := Donante newNombre: 'Carlos Griguol' dni: 22333444 telefono: 0012334 legajo: '12345/6' email:'lobo@ee.com'  nroDonante: 666.
tipo1 := TransferenciaBancaria new.
donacion1 := Donacion newDonante: donante1 monto: 555 mesPago: 12 untipo: tipo1 organizacion: org1 .
]
