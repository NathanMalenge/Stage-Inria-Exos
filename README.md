# Stage Inria - Exercices Pharo

Ce dépôt contient mes travaux pratiques réalisés dans le cadre de ma candidature pour un stage à l'Inria (Équipe EVREF / Spirals).

## 🚀 Évolution de l'implémentation (LList)

Au début de l'exercice sur la Liste Chaînée (**LList**), j'avais opté pour une approche "naïve" avec beaucoup de structures de contrôle :
* Utilisation de `ifTrue:ifFalse:` pour gérer les cas `nil`.
* Boucles `whileTrue:` pour parcourir les nœuds.

### Leçon du MOOC
En approfondissant les vidéos du **MOOC Pharo** (notamment sur l'essence du *Dispatch* en semaine 4), j'ai compris que les objets devaient porter leur propre logique.

### 🛠 Architecture actuelle 
Pour supprimer les tests de nullité et les boucles, j'ai refactorisé le code avec une structure à trois classes :
* `AListNode` : Classe mère abstraite définissant le contrat (interface).
* `LListNode` : Nœud contenant une donnée (`value`) et le suivant (`next`).
* `LListEmpty` : Un **Null Object** qui représente la fin de liste et gère les cas d'arrêt.

## ⚙️ Installation
1. Cloner le dépôt.
2. Importer le package via **Iceberg** dans Pharo.
3. Exécuter les tests unitaires dans le **Test Runner**.
