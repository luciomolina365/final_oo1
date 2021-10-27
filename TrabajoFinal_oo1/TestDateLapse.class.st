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
	periodo3 := DateLapse newFechaIni: '2021/1/1' fechaFin: '2022/1/1'.
]

{ #category : #tests }
TestDateLapse >> testIncludesDate [

	
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
