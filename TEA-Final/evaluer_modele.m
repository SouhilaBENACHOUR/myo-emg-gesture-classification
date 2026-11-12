function evaluer_modele(predictions, y_true)
    % Convert logical predictions to numeric (0s and 1s)
    predictions_numeric = double(predictions);
    
    % Round the numeric predictions
    predictions_rounded = round(predictions_numeric);
    
    % Calculate accuracy
    accuracy = sum(predictions_rounded == y_true) / length(y_true) * 100;
    fprintf('Précision du modèle : %.2f%%\n', accuracy);
    
    % Compute confusion matrix
    confusion_matrix = confusionmat(y_true, predictions_rounded);
    disp('Matrice de confusion :');
    disp(confusion_matrix);
    
    % Affichage des résultats de la régression
    figure;
    hold on;
    plot(y_true, 'ro', 'DisplayName', 'Valeurs Réelles');
    plot(predictions_rounded, 'bx', 'DisplayName', 'Prédictions');
    title('Prédictions du Modèle de Régression Linéaire');
    xlabel('Index');
    ylabel('Classe');
    legend('show');
    grid on;
    hold off;
end
