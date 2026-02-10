""I am a documentation generator inspired by Javadoc, created for the Inria internship technical test.

    My purpose is to take a Pharo class as input and generate a clean HTML file containing its metadata and its behavior. I demonstrate the power of Pharo's introspection (meta-programming).

    How I work: Instead of parsing source code files, I directly query the Class object to extract its name, its class comment, and the list of its method selectors.

    Public Interface: - #generateFor: aClass : The main entry point. It takes a Class (e.g., LList), extracts its information, and writes a file named '<ClassName>.html' in the local directory.

    Technical details: - I use a WriteStream to build the HTML content efficiently. - I use #selectors to retrieve all methods defined in the class. - I use #asFileReference and #writeStreamDo: to handle file system operations safely.

    Example of use: JavadocGenerator new generateFor: LList.
"
Class {
	#name : 'JavadocGenerator',
	#superclass : 'Object',
	#category : 'Stage-Nathan-Doc-Generator',
	#package : 'Stage-Nathan-Doc-Generator'
}

{ #category : 'as yet unclassified' }
JavadocGenerator >> generateFor: aClass [
	|nom doc html|
	nom:= aClass name asString.
	doc := aClass comment asString.
	html := String streamContents: [ :stream |
		stream nextPutAll: '<html><body>'. 
		stream nextPutAll: '<h1>Documentation de la classe : ', nom, '</h1>'.
		stream nextPutAll: '<p>', doc, '</p>'.
		
		stream nextPutAll: '<h2>Liste des méthodes :</h2>'.
        stream nextPutAll: '<ul>'.
        
        aClass selectors do: [ :uneMethode | 
            stream nextPutAll: '<li>'.
            stream nextPutAll: uneMethode asString.
            stream nextPutAll: '</li>' ].
            
        stream nextPutAll: '</ul>'.

      stream nextPutAll: '</body></html>' ].

(nom, '.html') asFileReference writeStreamDo: [ :f | f nextPutAll: html ].
	
]
