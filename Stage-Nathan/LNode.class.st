"
I represent a single link in a linked list. 

I hold a value (any object) and a reference to the next node in the list. 

Attributes:
- value: 	anObject (the data stored in this node)
- next: 	aLNode or nil (the pointer to the following element)

Example:
	LNode new value: 42; next: nil.
"
Class {
	#name : 'LNode',
	#superclass : 'Object',
	#instVars : [
		'value',
		'next'
	],
	#category : 'Stage-Nathan',
	#package : 'Stage-Nathan'
}

{ #category : 'accessing' }
LNode >> next [
	"gets the next node of this"

	^ next
]

{ #category : 'accessing' }
LNode >> next: anObject [
	"sets the next node of this to anObject"

	next := anObject
]

{ #category : 'evaluating' }
LNode >> value [ 
	"gets the value of this node"

	^ value 
]

{ #category : 'accessing' }
LNode >> value: anObject [
	"sets the value of this node with anObject"
	value := anObject
]
