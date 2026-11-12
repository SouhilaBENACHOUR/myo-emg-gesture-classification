function extraire_caracteristiques_et_afficher_segments(data, windowSize, overlap, fs)
    % Calculer le nombre de segments
    numSegments = floor((length(data) - windowSize) / (windowSize - overlap)) + 1;
    % Créer une figure unique pour tous les segments
    figure;
    for i = 1:numSegments
        % Définir les indices de début et de fin pour le segment courant
        startIdx = (i - 1) * (windowSize - overlap) + 1;
        endIdx = startIdx + windowSize - 1;

        if endIdx > length(data)
            break;
        end
        
        % Extraire le segment et appliquer la fenêtre rectangulaire
        segment = data(startIdx:endIdx);
        windowed_segment = segment .* rectwin(windowSize);
        
        % Créer une copie du signal entier avec tout à zéro, sauf le segment actuel
        isolated_segment = zeros(size(data));
        isolated_segment(startIdx:endIdx) = windowed_segment;
        
        % Afficher le signal isolé dans un sous-graphique
        subplot(5, 2, i); % Créer des sous-graphes verticaux
        plot(isolated_segment, 'm', 'LineWidth', 1.5); % Augmenter l'épaisseur de la ligne pour plus de visibilité 
        xlabel('Échantillons');
        ylabel('Amplitude');
        grid on;
        
        % Ajustement des limites de l'axe
        ylim([-max(abs(windowed_segment)) * 1.1, max(abs(windowed_segment)) * 1.1]);
        
        % Ajouter un espace entre les sous-graphes
        set(gca, 'Position', get(gca, 'Position') + [0, 0.01 * (numSegments - i), 0, 0]);
    end
    
    % Ajuster l'espacement entre les sous-graphes pour plus de clarté
    title('Segments avec Fenêtre Rectangulaire'); % Titre global pour la figure
end
