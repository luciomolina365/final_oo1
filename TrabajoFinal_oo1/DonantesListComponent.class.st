Class {
	#name : #DonantesListComponent,
	#superclass : #WAComponent,
	#instVars : [
		'donante',
		'lista',
		'parent'
	],
	#category : #'TrabajoFinal_oo1-ui'
}

{ #category : #'instance creation' }
DonantesListComponent class >> newDonante:unDonante lista: unaLista parent: aParent [
	| instance |
	instance := self new.
	instance donante:unDonante lista: unaLista parent: aParent.
	^ instance
]
