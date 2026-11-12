% Fonction pour prédire la probabilité logistique
function prob = predict_logistic(X, beta)
    % Calcule la probabilité en appliquant la fonction sigmoïde sur X * beta
    prob = sigmoid(X * beta);
end