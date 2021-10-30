Class {
	#name : #Ayuda,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'monto',
		'donante',
		'tipo'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
Ayuda class >> newDonante: unDonante monto: unMonto untipo: unTipo [

	^ self new donante: unDonante monto: unMonto untipo: unTipo
]

{ #category : #accessing }
Ayuda >> donante [

	^ donante
]

{ #category : #private }
Ayuda >> donante: unDonante monto: unMonto untipo: unTipo [ 

	donante := unDonante.
	monto := unMonto.
	fecha := Date today.
	tipo := unTipo.

]

{ #category : #accessing }
Ayuda >> esDeAnioActual [

	^ fecha year = Date today year
]

{ #category : #accessing }
Ayuda >> fecha [
^fecha
]

{ #category : #private }
Ayuda >> fecha: unaFecha [

	fecha := unaFecha
]

{ #category : #accessing }
Ayuda >> montoNeto [

	^ monto - (tipo gastoDeComision: monto)
]

{ #category : #accessing }
Ayuda >> perteneceA: unDonante [

	^ donante == unDonante

]

{ #category : #accessing }
Ayuda >> perteneceAlPeriodo: unDateLapse [

	^ unDateLapse includesDate: fecha
]
