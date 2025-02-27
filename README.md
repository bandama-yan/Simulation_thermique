# Simulation thermique

Ce projet consiste à simuler et optimiser un problème thermique en 2D à l'aide de la méthode des éléments finis . L'objectif est de déterminer la température dans un four en fonction des résistances électriques (problème direct) et d'optimiser les valeurs des résistances pour obtenir une température idéale de cuisson (problème inverse).

## Structure du projet

Le projet est composé des fichiers suivants :

- **affichemaillage.m** : Affiche le maillage du domaine de simulation.
- **calcul_Kloc.m** : Calcule la matrice de rigidité.
- **calcul_Mloc.m** : Calcule la matrice de masse locale.
- **coordonnees_barycentriques.m** : Calcule les coordonnées barycentriques pour les éléments finis.
- **elimination.m** : Effectue l'élimination des degrés de liberté associés aux conditions aux limites.
- **maillagefin.amdba** : Fichier de configuration pour le maillage final.
- **maillagegros.amdba** : Fichier de configuration pour le maillage grossier.
- **main.m** : Fichier principal qui exécute la simulation.
- **matrice.m** : Calcule la matrice de conductivité globale.
- **matrice_inv.m** : Calcule l'inverse de la matrice de conductivité.
- **matrice_masse.m** : Calcule la matrice de masse globale.
- **optimiser_positions_resistances.m** : Optimise les positions des résistances électriques.
- **point_dans_triangle.m** : Vérifie si un point se trouve à l'intérieur d'un triangle.
- **lire_amdba.m** : Lit les fichiers de configuration pour les maillages.
- **second_membre1.m** : Calcule le premier membre du problème direct.
- **second_membre2.m** : Calcule le second membre du problème direct.
- **second_membre_inv.m** : Calcule le second membre du probleme inverse.
- **tableau_T.m** : Calcule la température à chaque point du maillage.

## Installation

Assurez-vous d'avoir MATLAB installé. Le projet utilise les fonctions MATLAB de base, il n'y a donc pas de dépendances externes supplémentaires à installer.

