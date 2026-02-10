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
	#category : 'Stage-Nathan-Liste',
	#package : 'Stage-Nathan-Liste'
}

{ #category : 'adding' }
LList >> add: aValue [
	"adds a new Node composed of aValue at the end of this list"

	head:= head add:aValue.
	
	
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
    ^ head at:anIndex.
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

{ #category : 'initialization' }
LList >> initialize [
    super initialize. "Toujours appeler le parent par réflexe"
    head := LEmpty new.
]

{ #category : 'accessing' }
LList >> remove: anElement [
    "remove the element if it exists in the list, else raise error"
    head:= head remove:anElement.
    
]

{ #category : 'accessing' }
LList >> size [
	"gets the size of this list"
	^head size.

]
