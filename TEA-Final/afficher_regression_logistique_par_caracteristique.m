function afficher_regression_logistique_par_caracteristique(X, y, beta)
    % It?re sur chaque caract?ristique pour g?n?rer une figure de r?gression logistique
    noms_caracteristiques = {'Amplitude Max', 'Frequence Max', 'energie', 'ecart-Type'};
    for i = 1:4  % Il y a 4 caract?ristiques
        min_X = min(X(:, i));
        max_X = max(X(:, i));
        X_vals = linspace(min_X, max_X, 100)';
        % Ajout du biais et de la caract?ristique courante pour la r?gression
        X_vals_biais = [ones(size(X_vals, 1), 1), X_vals];
        % Utiliser seulement l'intercept et le coefficient pour la caract?ristique actuelle
        beta_subset = [beta(1); beta(i + 1)];
        % Calcul des pr?dictions de probabilit? avec la fonction logistique
        y_vals = predict_logistic(X_vals_biais, beta_subset);
        % Indices pour distinguer les points des deux classes
        idx_fist = (y == 1);          % Mouvement fist
        idx_double_fist = (y == 0);   % Mouvement double tap
        % Cr?ation de la figure pour la caract?ristique actuelle
        figure;
        hold on;
        % Affichage des points de chaque classe avec un marqueur sp?cifique
        scatter(X(idx_fist, i), y(idx_fist), 70, 'o', 'filled', 'DisplayName', 'Fist');
        scatter(X(idx_double_fist, i), y(idx_double_fist), 70, 'x', 'DisplayName', 'Double Tap');
        % Trac? de la courbe logistique
        plot(X_vals, y_vals, 'k-', 'LineWidth', 2, 'DisplayName', 'Courbe Logistique');
        % Configuration des axes et de la l?gende
        title(['R?gression Logistique - ', noms_caracteristiques{i}]);
        xlabel(noms_caracteristiques{i});
        ylabel('Probabilit? Pr?dite');
        legend('show');
        grid on;
        hold off;
    end
end


