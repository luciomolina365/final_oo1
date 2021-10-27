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
	self renderOrganizaciones:aCanvas.
	aCanvas horizontalRule.
	self renderIntegrantes: aCanvas .

	
]

{ #category : #rendering }
MainComponent >> renderIntegrantes: aCanvas [
	aCanvas unorderedList: [ 
		(self model integrantes) do: [ :donante |
			aCanvas render: (DonantesComponent newDonante:donante parent:self )]] 
]

{ #category : #rendering }
MainComponent >> renderOrganizaciones: aCanvas [
	aCanvas unorderedList: [ 
		(self model organizaciones) do: [ :organizacion |
			aCanvas render: (OrganizacionComponent newOrg:organizacion parent: self)]] 
]

{ #category : #'as yet unclassified' }
MainComponent >> verDonaciones: unDonante [

	| instance coordi |
	coordi := self model coordinador.
	instance := DonantesListComponent
		            newDonante: unDonante
		            lista: (coordi donacionesDeDonante: unDonante)
		            parent: self.
	self call: instance
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
