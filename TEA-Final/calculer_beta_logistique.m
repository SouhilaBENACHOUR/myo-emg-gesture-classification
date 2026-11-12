function beta = calculer_beta_logistique(X, y)
    % Fonction de coût pour la régression logistique
    function J = costFunction(beta)
        m = length(y);
        h = sigmoid(X * beta);
        J = -(1/m) * sum(y .* log(h) + (1 - y) .* log(1 - h));
    end

    % Initialisation de beta
    beta_initial = zeros(size(X, 2), 1);

    % Utilisation de fminsearch pour minimiser la fonction de coût
    options = optimset('MaxIter', 400, 'Display', 'off');
    beta = fminsearch(@costFunction, beta_initial, options);
end
