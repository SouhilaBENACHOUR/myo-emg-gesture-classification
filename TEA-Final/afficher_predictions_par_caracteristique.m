function afficher_predictions_par_caracteristique(X, y, beta)
    % Noms des caractéristiques
    nom_ecart_type = 'Écart-Type';
    nom_energie = 'Énergie'; 
    % Création de la figure pour afficher l'écart-type par rapport à l'énergie
    figure;
    hold on;
    % Indices pour distinguer les points des deux classes
    idx_fist = (y == 1);          % Mouvement fist
    idx_double_fist = (y == 0);   % Mouvement double tap
    % Affichage des points de chaque classe
    scatter(X(idx_fist, 1), X(idx_fist, 2), 70, 'o', 'filled', 'DisplayName', 'Fist');  % Y: écart-type, X: énergie
    scatter(X(idx_double_fist, 1), X(idx_double_fist, 2), 70, 'x', 'DisplayName', 'Double Tap');
    % Configuration des axes
    xlabel(nom_ecart_type);
    ylabel(nom_energie);
    title('Prédictions de la Régression Logistique');
    % Tracer la courbe logistique
    % Générer les valeurs pour prédiction
    X_vals = linspace(min(X(:, 1)), max(X(:, 1)), 100)';  % Écart-Type
    % Calculer la prédiction en fonction de l'écart-type
    y_vals = -(beta(2) * X_vals + beta(1)) / beta(3); % Y (Énergie)
    % Tracer la droite de régression
    plot(X_vals, y_vals, 'r-', 'LineWidth', 2, 'DisplayName', 'Droite de Régression');
    % Ajout d'une grille et légende
    grid on;
    legend('show');
    hold off;
end
