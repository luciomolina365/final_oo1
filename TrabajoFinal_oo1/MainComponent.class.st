Class {
	#name : #MainComponent,
	#superclass : #WAComponent,
	#category : #'TrabajoFinal_oo1-ui'
}

{ #category : #'as yet unclassified' }
MainComponent >> createNewCoordinador [
	self call: NewCoordinadorComponent new.
]

{ #category : #'as yet unclassified' }
MainComponent >> createNewDonante [
	self call: NewDonanteComponent new.
]

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
MainComponent >> renderIntegranteButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [  ];
				with: [ aCanvas button with: 'CrearDonante' ]. 
		 aCanvas callback: [  ];
		with: [ aCanvas button: 'Crear Coordinador' ]].
]

{ #category : #rendering }
MainComponent >> renderOrganizaciones: aCanvas [
	aCanvas unorderedList: [ 
		self model organizaciones do: [ :organizacion |
			aCanvas render: (OrganizacionComponent newOrg:organizacion parent: self)]]
]
