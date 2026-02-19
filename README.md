# Stage Inria - Exercices Pharo

Ce dépôt contient mes travaux pratiques ayant pour but de m'initier aux bases de pharo.
Ils ont été réalisés dans le cadre de ma candidature pour un stage à l'Inria.

## Évolution de l'implémentation de la LList

Au début de l'exercice sur la Liste Chaînée (**LList**), j'avais opté pour une approche "naïve" avec beaucoup de structures de contrôle :
* Utilisation de `ifTrue:ifFalse:` pour gérer les cas `nil`.
* Boucles `whileTrue:` pour parcourir les nœuds.

### Leçon du MOOC
En approfondissant les vidéos du **MOOC Pharo** (notamment sur l'essence du *Dispatch* en semaine 4), j'ai compris que les objets devaient porter leur propre logique.

### Architecture actuelle 
Pour supprimer les tests de nullité et les boucles, j'ai refactorisé le code avec une structure à trois classes :
* `AListNode` : Classe mère abstraite définissant le contrat (interface).
* `LListNode` : Nœud contenant une donnée (`value`) et le suivant (`next`).
* `LListEmpty` : Un **Null Object** qui représente la fin de liste et gère les cas d'arrêt.

## Installation
1. Cloner le dépôt.
2. Importer le package via **Iceberg** dans Pharo.
3. Exécuter les tests unitaires dans le **Test Runner**.

## Générateur de Documentation 

Ensuite, j'ai développé un **JavadocGenerator** :

* Le générateur utilise les API de Pharo pour inspecter dynamiquement les classes (`methods`, `comment`, `selectors`) sans connaître leur structure à l'avance.
* Transformation des métadonnées extraites en un fichier HTML structuré, permettant une lecture rapide de l'API d'un package.
* Utilisation de `Streams` pour construire efficacement le document de sortie.
---

## Comment l'utiliser ?

Pour générer la documentation d'une classe, il suffit d'exécuter dans un **Playground** :

```smalltalk
JavadocGenerator new generateFor: LList.
