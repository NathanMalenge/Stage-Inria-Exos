"
I represent an empty node at the end of a Linked List.

Instead of using 'nil', the LList uses me to signify the end of the chain. This allows the system to use polymorphism (dispatch) instead of explicit nil checks.

For example, when asked for my #size, I simply return 0 without needing an 'if' statement
"
Class {
	#name : 'LEmpty',
	#superclass : 'ALNode',
	#category : 'Stage-Nathan-Liste',
	#package : 'Stage-Nathan-Liste'
}

{ #category : 'accessing' }
LEmpty >> add: anObject [
    "Je suis vide, donc si on ajoute, je deviens un vrai nœud"
    ^ LNode new 
        value: anObject; 
        next: self; 
        yourself
]

{ #category : 'accessing' }
LEmpty >> at: anIndex [
    self error: 'Index hors limites'
]

{ #category : 'accessing' }
LEmpty >> remove: anObject [
    "L'objet n'est pas là, on ne change rien, on renvoie soi-même"
    self error: 'Element non présent dans la liste '
]

{ #category : 'accessing' }
LEmpty >> size [
    ^ 0
]
