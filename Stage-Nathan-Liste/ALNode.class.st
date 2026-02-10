"
I am an abstract class representing a node in a Linked List.

My main purpose is to define the common interface for all types of nodes (both value-holding nodes and empty nodes).

I enable polymorphism in the LList implementation: instead of checking for nil, the list sends messages to my subclasses (LListNode and LListEmpty). This design follows the Composite pattern, allowing for recursive operations like #size or #at: without explicit conditional loops.
"
Class {
	#name : 'ALNode',
	#superclass : 'Object',
	#category : 'Stage-Nathan-Liste',
	#package : 'Stage-Nathan-Liste'
}

{ #category : 'adding' }
ALNode >> add: anObject [
    "Ajoute un objet à la fin de la chaîne."
    ^ self subclassResponsibility
]

{ #category : 'accessing' }
ALNode >> at: anIndex [
    "Retourne l'élément à l'index donné."
    ^ self subclassResponsibility
]

{ #category : 'accessing' }
ALNode >> size [
    ^ self subclassResponsibility
]
