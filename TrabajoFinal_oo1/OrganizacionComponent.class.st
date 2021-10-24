Class {
	#name : #OrganizacionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'organizacion',
		'parent'
	],
	#category : #'TrabajoFinal_oo1-ui'
}

{ #category : #'instance creation' }
OrganizacionComponent class >> newOrg: unaOrganizacion parent: aParent [
	| instance |
	instance := self new.
	instance organizacion: unaOrganizacion parent: aParent.
	^ instance
]

{ #category : #accessing }
OrganizacionComponent >> organizacion [
^organizacion
]

{ #category : #'as yet unclassified' }
OrganizacionComponent >> organizacion: unaOrganizacion parent: aParent [

organizacion:=unaOrganizacion.
parent:=aParent 
]

{ #category : #accessing }
OrganizacionComponent >> parent [ 
^parent
]
