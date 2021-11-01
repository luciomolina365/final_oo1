Class {
	#name : #TestAyuda,
	#superclass : #TestCase,
	#instVars : [
		'donante1',
		'tipo1',
		'ayuda1',
		'donante2',
		'tipo2',
		'ayuda2',
		'donante3',
		'tipo3',
		'ayuda3'
	],
	#category : #'TrabajoFinal_oo1-Tests'
}

{ #category : #running }
TestAyuda >> setUp [

	donante1 := Donante
		            newNombre: 'Carlos Griguol'
		            dni: 22333444
		            telefono: 0012334
		            legajo: '12345/6'
		            email: 'lobo@ee.com'
		            nroDonante: 666.
	tipo1 := TransferenciaBancaria new.

	
	ayuda1 := Ayuda
		             newDonante: donante1
		             monto: 555
		             untipo: tipo1.

	"-------------------------------------------"
	donante2 := Donante
		            newNombre: 'Leandre Mika'
		            dni: 9999999
		            telefono: 001232323
		            legajo: '00001/2'
		            email: 'lobo22@ea.com'
		            nroDonante: 111.

	tipo2 := Efectivo new.

	ayuda2 := Ayuda
		             newDonante: donante2
		             monto: 555
		             untipo: tipo2.
	ayuda2 fecha: (Date year: 1999 month: 1 day: 1).

	"-------------------------------------------"
	donante3 := Donante
		            newNombre: 'Leandre Mika'
		            dni: 9999999
		            telefono: 001232323
		            legajo: '00001/2'
		            email: 'lobo22@ea.com'
		            nroDonante: 444.
	tipo3 := PagoFacil new.

	ayuda3 := Donacion
		             newDonante: donante3
		             monto: 555
		             untipo: tipo3.

]

{ #category : #accessing }
TestAyuda >> testEsDeAnioActual [

	self assert: ayuda1 esDeAnioActual equals: true.
	"La fecha se asigna en la creacion de la instacia"
	
	ayuda1 fecha: (Date year: 1999 month: 9 day: 9).
	self assert: ayuda1 esDeAnioActual equals: false.
	
	ayuda1 fecha: (Date year: 2021 month: 9 day: 9).
	self assert: ayuda1 esDeAnioActual equals: true.
]

{ #category : #tests }
TestAyuda >> testMontoNeto [

	self assert: ayuda1 montoNeto equals: 499.5. "TransferenciaBancaria 10%"
	self assert: ayuda2 montoNeto equals: 555. "Efectivo 0%"
	self assert: ayuda3 montoNeto equals: 471.75 "PagoFacil 15%"
]

{ #category : #tests }
TestAyuda >> testPerteneceA [

	self assert: (ayuda1 perteneceA: donante1 ).
	self deny: (ayuda1 perteneceA: donante2 ).
	
]

{ #category : #tests }
TestAyuda >> testPerteneceAlPeriodo [

	| d |
	d := DateLapse newFechaIni: '1999/09/02' fechaFin: '2003/09/10'.
	self deny: [ ayuda1 perteneceAlPeriodo: d ]. "Fecha de hoy"
	self deny: [ ayuda2 perteneceAlPeriodo: d ]. "1999/1/1"
	d := DateLapse newFechaIni: '1999/09/02' fechaFin: '3000/12/11'.
	self assert: [ ayuda1 perteneceAlPeriodo: d ]. "Fecha de hoy"
	self deny: [ ayuda2 perteneceAlPeriodo: d ] "1999/1/1"
]
