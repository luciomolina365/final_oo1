Class {
	#name : #DateLapse,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : #Objetos1Ejer15
}

{ #category : #'instance creation' }
DateLapse class >> newFechaIni: unaFechaI fechaFin: unaFechaF [
	
	|instanciaFecha|
	instanciaFecha := self new.
	instanciaFecha newFechaIni: unaFechaI fechaFin:unaFechaF .
	^instanciaFecha .
]

{ #category : #'instance creation' }
DateLapse class >> newFechaInicial: unaFechaI fechaFinal: unaFechaF [
	
	|instanciaFecha|
	instanciaFecha := self new.
	instanciaFecha newFechaInicial: unaFechaI fechaFinal:unaFechaF .
	^instanciaFecha .
]

{ #category : #accesing }
DateLapse >> from [
^from
]

{ #category : #testing }
DateLapse >> includesDate: aDate [
	
	  (aDate isOnOrAfter: self from) & (aDate isOnOrBefore: self to) ifTrue: [^true].
	^false
]

{ #category : #'instance creation' }
DateLapse >> newFechaIni: unaFechaI fechaFin: unaFechaF [

from :=Date fromString: unaFechaI.
to :=Date fromString: unaFechaF.
]

{ #category : #'instance creation' }
DateLapse >> newFechaInicial: unaFechaI fechaFinal:unaFechaF [.
from :=unaFechaI.
to :=unaFechaF.
]

{ #category : #accesing }
DateLapse >> sizeInDays [
	|dias|
	dias := (self to - self from) asDays.
	^dias
]

{ #category : #accesing }
DateLapse >> to [
^to 
]
