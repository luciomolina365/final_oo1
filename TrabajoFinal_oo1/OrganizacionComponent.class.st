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

{ #category : #rendering }
OrganizacionComponent >> renderContentOn: aCanvas [
	aCanvas paragraph
		with: [ aCanvas heading
				level: 2;
				with: [aCanvas anchor style:'color:darkviolet';
					callback: [ ];
				with: (organizacion nombre) ]].
			aCanvas text: ' Denominacion '.
			aCanvas space.
			aCanvas text: organizacion denominacion.
			aCanvas space.
			aCanvas text: 'Representante Legal'.
			aCanvas space.
			aCanvas text: organizacion representanteLegal .
			aCanvas break.
			aCanvas text: 'Direccion'.
			aCanvas space.
			aCanvas text: organizacion direccion.
			aCanvas break.
			aCanvas horizontalRule.
]
