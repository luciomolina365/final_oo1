Class {
	#name : #DateLapse,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : #'TrabajoFinal_oo1-Model'
}

{ #category : #'instance creation' }
DateLapse class >> newFechaIni: unaFechaI fechaFin: unaFechaF [ 

	|instanciaFecha|
	instanciaFecha := self new.
	instanciaFecha newFechaIni: unaFechaI fechaFin:unaFechaF .
	^instanciaFecha 
]

{ #category : #'instance creation' }
DateLapse class >> newFechaInicial: unaFechaI fechaFinal: unaFechaF [ 

	|instanciaFecha|
	instanciaFecha := self new.
	instanciaFecha newFechaInicial: unaFechaI fechaFinal:unaFechaF .
	^instanciaFecha .
]

{ #category : #'instance creation' }
DateLapse class >> newPeriodoDeMesActual [ 

	^ self new periodoDeMesActual
]

{ #category : #accessing }
DateLapse >> from [ 
^from
]

{ #category : #accessing }
DateLapse >> includesDate: aDate [ 

	  (aDate isOnOrAfter: self from) & (aDate isOnOrBefore: self to) ifTrue: [^true].
	^false
]

{ #category : #'instance creation' }
DateLapse >> newFechaIni: unaFechaI fechaFin: unaFechaF [ 

	from := Date fromString: unaFechaI.
	to := Date fromString: unaFechaF
]

{ #category : #'instance creation' }
DateLapse >> newFechaInicial: unaFechaI fechaFinal: unaFechaF [ 

	from := unaFechaI.
	to := unaFechaF
]

{ #category : #accessing }
DateLapse >> periodoDeMesActual [ 

	to := Date today.
	from := Date year: to year month: to monthIndex day: 1


]

{ #category : #accessing }
DateLapse >> sizeInDays [ 
	|dias|
	dias := (self to - self from) asDays.
	^dias


]

{ #category : #accessing }
DateLapse >> to [ 
^to 

]
