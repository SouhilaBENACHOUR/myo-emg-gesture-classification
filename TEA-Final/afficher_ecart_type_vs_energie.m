function afficher_ecart_type_vs_energie(X, y)
    % Indices des colonnes pour l'énergie et l'écart-type
    indice_energie = 3;  % Colonne 3 pour l'énergie
    indice_ecart_type = 4;  % Colonne 4 pour l'écart-type

    % Indices pour distinguer les points des deux classes
    idx_fist = (y == 1);          % Mouvement fist
    idx_double_fist = (y == 0);   % Mouvement double tap

    % Création de la figure pour l'affichage
    figure;
    hold on;

    % Affichage des points de chaque classe
    scatter(X(idx_fist, indice_energie), X(idx_fist, indice_ecart_type), 70, 'o', 'filled', 'DisplayName', 'Fist');
    scatter(X(idx_double_fist, indice_energie), X(idx_double_fist, indice_ecart_type), 70, 'x', 'DisplayName', 'Double Tap');

    % Configuration des axes
    xlabel('Énergie');
    ylabel('Écart-Type');
    title('Écart-Type en Fonction de l\''energie');
    legend('show');
    grid on;
    hold off;
end
