Class {
	#name : #Donante,
	#superclass : #Integrante,
	#instVars : [
		'email',
		'nroDonante'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
Donante class >> newNombre:unNombre dni:unDni telefono:unTelefono legajo:unLegajo email:unEmail nroDonante:unNumero [
|instancia|
instancia:= self newNombre: unNombre  dni:unDni  telefono:unTelefono  legajo:unLegajo. 
instancia email: unEmail nroDonante:unNumero.
^instancia  
]

{ #category : #accessing }
Donante >> email [
^email
]

{ #category : #private }
Donante >> email: unEmail nroDonante: unNumero [

	email := unEmail.
	nroDonante := unNumero
]

{ #category : #private }
Donante >> esUnCoordinador [
	^false
]

{ #category : #accessing }
Donante >> nroDonante [
^nroDonante
]

{ #category : #private }
Donante >> tieneNro: unNroDeDonante [

	^ nroDonante == unNroDeDonante
]
