Class {
	#name : #OrganizacionListComponent,
	#superclass : #WAComponent,
	#instVars : [
		'organizacion',
		'parent',
		'coordi'
	],
	#category : #'TrabajoFinal_oo1-ui'
}

{ #category : #'instance creation' }
OrganizacionListComponent class >> newOrg: unaOrganizacion parent: aParent [
	| instance |
	instance := self new.
	instance organizacion: unaOrganizacion parent: aParent.
	^ instance
]

{ #category : #'instance creation' }
OrganizacionListComponent class >> newOrg: unaOrganizacion parent: aParent coordi:unCoordinador [
	| instance |
	instance := self new.
	instance organizacion: unaOrganizacion parent: aParent coordi:unCoordinador .
	^ instance
]

{ #category : #'as yet unclassified' }
OrganizacionListComponent >> organizacion: unaOrganizacion parent: aParent coordi:unCoordinador [ 

organizacion:= unaOrganizacion. 
parent:= aParent .
coordi:=unCoordinador .

]

{ #category : #rendering }
OrganizacionListComponent >> renderContentOn: aCanvas [
	aCanvas heading style:' background-color: black; color:white'; with:'Final oo1 '.
	aCanvas horizontalRule.
	aCanvas
		form: [ aCanvas render: (OrganizacionComponent newOrg:organizacion parent:parent).
			self renderDonaciones: aCanvas ]
]

{ #category : #rendering }
OrganizacionListComponent >> renderDonaciones: aCanvas [
	aCanvas text:'Donantes'.
	aCanvas unorderedList: [ 
		organizacion donantes do: [ :donante | 
			aCanvas form: [ 
					aCanvas render: (DonantesListComponent
								 newDonante: donante
								 lista:
									 (coordi
										  donacionesDeDonante: donante
										  enOrganizacion: organizacion)
								 parent: parent) ].
							aCanvas horizontalRule.  ] ]
]
