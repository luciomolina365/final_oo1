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

{ #category : #'as yet unclassified' }
DonantesListComponent >> donante:unDonante lista: unaLista parent: aParent [

donante:=unDonante .
lista:= unaLista .
parent:= aParent.

]

{ #category : #rendering }
DonantesListComponent >> renderContentOn: aCanvas [

aCanvas paragraph
		style: 'font-size: 20px';
		with: [ aCanvas text: 'Integrante '.
			aCanvas strong
				with: [ aCanvas anchor
						callback: [ ];
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
			aCanvas text: donante nroDonante .
			aCanvas break.
			aCanvas text: 'Email:'.
			aCanvas space.
			aCanvas text: donante email.
			aCanvas break.
			aCanvas text: 'Donaciones '.
			lista
				do: [ :donacion | 
					aCanvas text: donante email.
			aCanvas break.
			aCanvas text: 'fecha '.
			aCanvas text: donacion fecha .
			aCanvas break.
			aCanvas text: 'Monto Neto'.
			aCanvas text: donacion montoNeto .
			aCanvas break.
			aCanvas text: 'Organizacion '.
			aCanvas text: donacion organizacion .
			aCanvas break.
			aCanvas text: 'Mes Pago '.
			aCanvas space.
			aCanvas text: donacion mesPago .
			aCanvas break.].
			aCanvas break.]
]
