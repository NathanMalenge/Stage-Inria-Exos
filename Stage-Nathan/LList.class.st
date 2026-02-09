"
I am a class of Linked List, created for the Inria internship exercises.

I manage a chain of LNode objects. I keep a reference to the first node of the chain (the head).

Instance Variables:
	head: (LNode or Nill) The first element of the list. 

Key Messages:
- add: anObject 		Adds an object at the end of the list.
- size 					Returns the number of elements in the list.
- at: anIndex 			Returns the value at the given index (starting from 1).
- remove: anObject 	Removes the first occurrence of anObject from the list.

Example of use:
	| myList |
	myList := LList new.
	myList add: 'hello'; add: 'world'.
	myList size. "">>> 2""
"
Class {
	#name : 'LList',
	#superclass : 'Object',
	#instVars : [
		'head'
	],
	#category : 'Stage-Nathan',
	#package : 'Stage-Nathan'
}

{ #category : 'adding' }
LList >> add: aValue [
	"adds a new Node composed of aValue at the end of this list"

	|node current|
	node := LNode new value: aValue.
	
	head ifNil: [ head := node.
        ^ self ].
	
	current := head.
	
	[current next isNotNil] whileTrue: [ current := current next ].
	
	current next: node.
	^self.
	
	
]

{ #category : 'adding' }
LList >> addFirst: aValue [
	"adds a new Node composed of aValue at the beginning of this list"

	|node |
	node := LNode new value: aValue; next: head.
	head:= node.
	
	
]

{ #category : 'accessing' }
LList >> at: anIndex [
    "return the element at the index anIndex"
    | count current |
    
    anIndex < 1 ifTrue: [ ^ self error: 'Index too small' ].
    
    count := 1.
    current := head.
    
    [ current isNotNil and: [ count < anIndex ] ] whileTrue: [ 
        count := count + 1. 
        current := current next ].
    
    ^ current 
        ifNil: [ self error: 'Index out of bounds' ] 
        ifNotNil: [ current value ]
]

{ #category : 'accessing' }
LList >> head [
	"gets the head of this list"
	^ head
]

{ #category : 'accessing' }
LList >> head: anObject [
	"sets the head of this list with anObject"

	head := anObject
]

{ #category : 'accessing' }
LList >> remove: anElement [
    "remove the element if it exists in the list, else raise error"
    | current |    
		head ifNil: [ ^ self error: 'The list is empty' ].
	 head value = anElement ifTrue: [ head := head next. ^self ].
    current := head.
	[ current next isNotNil and:[current next value ~= anElement ]] whileTrue: [ 
				current := current next ].
	
	current next ifNil: [ ^self error: 'The list does not contain this element' ].
	current next: current next next.
    
]

{ #category : 'accessing' }
LList >> size [
	"gets the size of this list"

	|count current|
	count := 0.
	current := head.
	
	[current isNotNil ] whileTrue: [ count := count +1. current := current next ].
	
	^count.

]
