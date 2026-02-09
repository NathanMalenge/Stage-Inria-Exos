"
I provide a suite of unit tests for the LList class.

I ensure that:
- New lists are empty.
- Elements can be added to the front (addFirst:) or the end (add:).
- Elements can be retrieved by index (at:), including error handling for out-of-bounds.
- Elements can be removed correctly (remove:), whether they are at the head or in the middle.

Execution:
    Click the green bubble next to my name in the System Browser to run all tests.
"
Class {
	#name : 'LListTest',
	#superclass : 'TestCase',
	#instVars : [
		'list'
	],
	#category : 'Stage-Nathan',
	#package : 'Stage-Nathan'
}

{ #category : 'running' }
LListTest >> setUp [
    super setUp.
    list := LList new.
]

{ #category : 'tests' }
LListTest >> testAddAndAt [
	"check that the list grows and that the nodes are placed well"
    list add: 'A'.
    list add: 'B'.
    list add: 'C'.
    
    self assert: list size equals: 3.
    self assert: (list at: 1) equals: 'A'.
    self assert: (list at: 2) equals: 'B'.
    self assert: (list at: 3) equals: 'C'.
]

{ #category : 'tests' }
LListTest >> testAddFirst [
	"check that method addFirst add elements at the head of the list"
    list addFirst: 'C'.
    list addFirst: 'B'.
    list addFirst: 'A'.
    self assert: list size equals: 3.
    self assert: (list at: 1) equals: 'A'. 
	self assert: (list at: 2) equals: 'B'. 
]

{ #category : 'tests' }
LListTest >> testAtOutOfBounds [
    list add: 'A'.
    
    "Checking that asking for the index 2 throws error"
    self should: [ list at: 2 ] raise: Error.
    self should: [ list at: 0 ] raise: Error.
]

{ #category : 'tests' }
LListTest >> testRemove [ 
    "check that method remove actually removes the given element"
    list add: 'A'.
    list add: 'B'.
    list add: 'C'.
    list add: 'D'.
    
    list remove: 'A'.
    self assert: list size equals: 3.
    self assert: (list at: 1) equals: 'B'.
    
    list remove: 'C'.
    self assert: list size equals: 2.
    self assert: (list at: 1) equals: 'B'.
    self assert: (list at: 2) equals: 'D'.
]

{ #category : 'tests' }
LListTest >> testRemoveNonExistantElement [
	"check that method remove return error when the given element is not in the list"
	list add:'A'.
	list add:'B'.
	list add:'C'.
	list add:'D'.
	self should: [ list remove:'E' ] raise: Error.
	
	
]

{ #category : 'tests' }
LListTest >> testSizeInitiallyZero [
	"check the list has 0 elements when created"
    self assert: list size equals: 0.
]
