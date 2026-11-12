% Fonction sigmoïde pour la régression logistique
function y = sigmoid(z)
    y = 1 ./ (1 + exp(-z));
end