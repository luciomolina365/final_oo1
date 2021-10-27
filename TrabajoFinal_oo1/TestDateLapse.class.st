Class {
	#name : #TestDateLapse,
	#superclass : #TestCase,
	#instVars : [
		'periodo1',
		'periodo2',
		'periodo3'
	],
	#category : #'TrabajoFinal_oo1-Tests'
}

{ #category : #running }
TestDateLapse >> setUp [
	periodo1 := DateLapse newFechaIni: '1999/1/1' fechaFin: '1999/1/4'.
	periodo2 := DateLapse newFechaIni: '1999/1/1' fechaFin: '1999/1/1'.
	periodo3 := DateLapse newFechaIni: '2021/1/1' fechaFin: '2021/1/3'.
]

{ #category : #tests }
TestDateLapse >> testIncludesDate [

	"2021/1/2"

	self assert:
		(periodo3 includesDate: (Date year: 2021 month: 1 day: 2)).
	
	self deny:
		(periodo3 includesDate: (Date year: 2021 month: 1 day: 4))	
]

{ #category : #tests }
TestDateLapse >> testPeriodoMesActual [

	| aux hoy |
	aux := DateLapse new periodoDeMesActual.
	hoy := Date today.

	self assert: aux to = hoy & (aux from year = hoy year)
		& (aux from monthIndex = hoy monthIndex) & (aux from dayOfMonth = 1)
]

{ #category : #tests }
TestDateLapse >> testSizeInDays [

	self assert: periodo1 sizeInDays equals: 3.
	self assert: periodo2 sizeInDays equals: 0.
	
	
]
