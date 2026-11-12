# Classification de gestes EMG – Myo Armband (MATLAB)

Projet TEA du module **Traitement du signal pour les objets intelligents** (Licence Informatique, La Rochelle Université, 2024/2025).

## Objectif

Distinguer deux gestes de la main, **« fist »** (poing fermé) et **« double tap »**, à partir des signaux électromyographiques (EMG) captés par les 8 capteurs du bracelet **Myo Armband**.

## Méthode

1. **Lecture des données** : import des enregistrements (1 colonne temps et 8 signaux EMG) et affichage des signaux.
2. **Segmentation** : découpage du signal en fenêtres glissantes avec chevauchement et fenêtrage rectangulaire.
3. **Extraction de caractéristiques par FFT** : pour chaque segment, on calcule
   - l'amplitude maximale du spectre,
   - la fréquence associée,
   - l'énergie,
   - l'écart-type.
4. **Classification** : régression logistique implémentée à la main (sigmoïde, fonction de coût, calcul des coefficients β).
5. **Évaluation** : précision, matrice de confusion et visualisation des prédictions pour chaque caractéristique.

## Résultats

L'**énergie** et l'**écart-type** séparent le mieux les deux gestes. L'amplitude maximale et la fréquence maximale discriminent moins bien. Pour aller plus loin, on peut envisager un SVM ou un réseau de neurones, de la régularisation L1/L2 ou une sélection de caractéristiques (ACP).

## Structure du projet

```
.
├── Rapport-TEA-Signal-HADDADOUetBENACHOUR.pdf   # Rapport complet
└── TEA-Final/
    ├── TEAs.m                                   # Script principal
    ├── lecture.m                                # Lecture et affichage des données
    ├── fistMat.txt / double_tapMat.txt          # Enregistrements EMG des deux gestes
    ├── extraire_caracteristiques_fourier.m      # Extraction des caractéristiques (FFT)
    ├── extraire_caracteristiques_et_afficher_segments.m
    ├── sigmoid.m, fonction_de_cout_logistique.m,
    │   calculer_beta_logistique.m, predict_logistic.m   # Régression logistique
    ├── evaluer_modele.m                         # Évaluation du modèle
    └── afficher_*.m                             # Visualisations
```

## Exécution

Ouvrir le dossier `TEA-Final` dans MATLAB, puis lancer :

```matlab
TEAs
```

## Auteures

- Lina HADDADOU
- Souhila BENACHOUR
