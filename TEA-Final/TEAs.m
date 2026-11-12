% Lecture des données complètes pour chaque mouvement
A = lecture('fistMat.txt');
B = lecture('double_tapMat.txt');

% Extraire uniquement le 8ème signal (9ème colonne de A et B)
signal_fist = A(:, 9);         
signal_double_fist = B(:, 9);   

% Longueur des signaux
N_fist = length(signal_fist);
N_double_fist = length(signal_double_fist);

% Paramètres pour la segmentation et le traitement
windowSize1 = 350;  % Taille de la fenêtre pour fist
windowSize = 270;   % Taille de la fenêtre pour double tap
overlap = 0;        % Chevauchement

fs = 1000;  % Fréquence d'échantillonnage

% Calcul du nombre de segments
numSegments_fist = floor((N_fist - windowSize1) / (windowSize1 - overlap)) + 1;
numSegments_double_fist = floor((N_double_fist - windowSize) / (windowSize - overlap)) + 1;

fprintf('Nombre de segments pour fist: %d\n', numSegments_fist);
fprintf('Nombre de segments pour double tap: %d\n', numSegments_double_fist);

% Extraction des caractéristiques pour chaque mouvement
caracteristiques_fist = extraire_caracteristiques_fourier(signal_fist, windowSize1, overlap, fs, 'fistMat');
caracteristiques_double_fist = extraire_caracteristiques_fourier(signal_double_fist, windowSize, overlap, fs, 'double_tapMat');
extraire_caracteristiques_et_afficher_segments(signal_double_fist, windowSize, overlap, fs);

% Préparation des données pour la régression logistique
X = [caracteristiques_fist; caracteristiques_double_fist];
y = [ones(size(caracteristiques_fist, 1), 1); zeros(size(caracteristiques_double_fist, 1), 1)];

% Ajout d'une colonne de biais pour le modèle
X_biais = [ones(size(X, 1), 1), X];

% Calcul des coefficients beta pour la régression logistique
beta = calculer_beta_logistique(X_biais, y);

% Affichage des coefficients
intercept = beta(1);
coefficients = beta(2:end);
fprintf('Intercept: %.4f\n', intercept);
fprintf('Coefficients: %.4f\n', coefficients');

% Validation du modèle en utilisant la régression logistique
predictions = predict_logistic(X_biais, beta);  % Prédictions basées sur le modèle logistique

% Évaluation des prédictions (en transformant les probabilités en classes : 0 ou 1)
classes_predites = predictions >= 0.5;  % Seuil pour classer les prédictions
evaluer_modele(classes_predites, y);    % Fonction d'évaluation

% Affichage des résultats de la régression logistique pour chaque caractéristique
afficher_regression_logistique_par_caracteristique(X, y, beta);

% Affichage de l'écart-type en fonction de l'énergie
afficher_ecart_type_vs_energie(X,y);
%afficher_ecart_type_vs_energie(z,w,beta);  % Nouvelle fonction pour afficher l'écart-type en fonction de l'énergie

