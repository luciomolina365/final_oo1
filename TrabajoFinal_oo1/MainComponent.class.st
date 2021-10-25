Class {
	#name : #MainComponent,
	#superclass : #WAComponent,
	#category : #'TrabajoFinal_oo1-ui'
}

{ #category : #accessing }
MainComponent >> model [ 
^Grupo soleInstance 
]

{ #category : #rendering }
MainComponent >> renderContentOn: aCanvas [
	aCanvas heading style:' background-color: black; color:white'; with:'FINAL OO1 '.
	aCanvas horizontalRule.
 
	
]

{ #category : #rendering }
MainComponent >> renderFuncionesButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [  ];
				with: [ aCanvas button with: 'Ver Organizacion' ]. 
		 aCanvas callback: [  ];
		with: [ aCanvas button: 'Ver Donantes' ]].
]

{ #category : #rendering }
MainComponent >> renderOrganizaciones: aCanvas [
	aCanvas unorderedList: [ 
		self model organizaciones do: [ :organizacion |
			aCanvas render: (OrganizacionComponent newOrg:organizacion parent: self)]]
]

{ #category : #'as yet unclassified' }
MainComponent >> verDonantes: organizacion [

	| instance |
	instance := OrganizacionListComponent
		            newOrg: organizacion
		            parent: self
						coordi:self model coordinador. 
	self call: instance
]
