Class {
	#name : #DonantesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'donante',
		'parent'
	],
	#category : #'TrabajoFinal_oo1-ui'
}

{ #category : #'instance creation' }
DonantesComponent class >> newDonante:unDonante parent: aParent [
	| instance |
	instance := self new.
	instance donante:unDonante parent: aParent.
	^ instance
]

{ #category : #'as yet unclassified' }
DonantesComponent >> donante:unDonante parent: aParent [

donante:=unDonante .
parent:= aParent.
]

{ #category : #rendering }
DonantesComponent >> renderContentOn: aCanvas [
	aCanvas text: 'Integrante '.
	aCanvas strong with: [ 
		aCanvas anchor
			callback: [ parent verDonaciones:donante  ];
			with: donante nombre ].
	aCanvas break.
	aCanvas text: 'Dni:'.
	aCanvas space.
	aCanvas text: donante dni.
	aCanvas break.
	aCanvas text: 'Telefono:'.
	aCanvas space.
	aCanvas text: donante telefono.
	aCanvas break.
	aCanvas text: 'Legajo:'.
	aCanvas space.
	aCanvas text: donante legajo.
	aCanvas break.
	aCanvas text: 'Nro Donante:'.
	aCanvas space.
	aCanvas text: donante nroDonante.
	aCanvas break.
	aCanvas text: 'Email:'.
	aCanvas space.
	aCanvas text: donante email.
	aCanvas break
]
