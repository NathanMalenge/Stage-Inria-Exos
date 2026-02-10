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
	#superclass : 'ALNode',
	#instVars : [
		'value',
		'next'
	],
	#category : 'Stage-Nathan',
	#package : 'Stage-Nathan'
}

{ #category : 'adding' }
LNode >> add: anObject [
    "Je délègue au suivant et je me retourne moi-même"
    next := next add: anObject.
    ^ self
]

{ #category : 'accessing' }
LNode >> at: anIndex [
    anIndex = 1 ifTrue: [ ^ value ].
    ^ next at: anIndex - 1
]

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

{ #category : 'accessing' }
LNode >> remove: anObject [
    value = anObject ifTrue: [ ^ next ].
    next := next remove: anObject.
    ^ self
]

{ #category : 'accessing' }
LNode >> size [
    ^ 1 + next size
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
