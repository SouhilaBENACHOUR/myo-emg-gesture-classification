function A = lecture(filename)
    % Vérification de l'existence du fichier
    if exist(filename, 'file') ~= 2
        error('Le fichier spécifié n''existe pas.');
    end

    % Lecture des données à partir du fichier spécifié
    A = csvread(filename);  % Utilisez csvread pour lire des fichiers CSV

    % Vérification du nombre de colonnes
    nCol = size(A, 2);
    if nCol ~= 9
        error('La matrice A doit contenir exactement 9 colonnes.');
    end

    % Affichage de la taille de A
    disp(size(A));

    % Création du vecteur temps
    temps = A(:, 1);  % Utiliser la première colonne pour le temps
    disp(temps)

    % Génération des graphiques
 
    figure;
    for i = 1:8
        subplot(4, 2, i);
        plot(temps, A(:, i + 1));  % i + 1 pour accéder aux signaux
        xlabel('Temps');
        ylabel(['Signal ', num2str(i)]);
        grid on;
    end
end
