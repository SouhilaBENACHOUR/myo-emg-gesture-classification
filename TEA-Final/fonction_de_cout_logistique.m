% Fonction de coût logistique pour la régression logistique
function [J, grad] = fonction_de_cout_logistique(beta, X, y)
    m = length(y); % Nombre d'exemples

    % Calcul de l'hypothèse (sigmoïde de X * beta)
    h = sigmoid(X * beta);

    % Calcul de la fonction de coût logistique
    J = (1 / m) * (-y' * log(h) - (1 - y)' * log(1 - h));

    % Calcul du gradient
    grad = (1 / m) * X' * (h - y);
end