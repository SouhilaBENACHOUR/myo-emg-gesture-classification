function features = extraire_caracteristiques_fourier(data, windowSize, overlap, fs, signal_name)
    numSegments = floor((length(data) - windowSize) / (windowSize - overlap)) + 1;
    features = zeros(numSegments, 4);

    % Figure pour les signaux bruts
    figure('Name', ['Signal Brut - ', signal_name], 'NumberTitle', 'off');
    title(['Signal Brut pour chaque segment (', signal_name, ')']);

    for i = 1:numSegments
        startIdx = (i - 1) * (windowSize - overlap) + 1;
        endIdx = startIdx + windowSize - 1;
       
        if endIdx > length(data)
            break;
        end
       
        % Extraction du segment
        segment = data(startIdx:endIdx);
        windowed_segment = segment .* rectwin(windowSize);
       
        % Afficher le signal brut dans la première figure
        subplot(5, 2, i);  % Organisation en 2 colonnes et 5 lignes
        plot(segment, 'b', 'LineWidth', 1.5);
        title(['Segment ', num2str(i), ' - Signal Brut']);
        xlabel('Temps');
        ylabel('Amplitude');
        grid on;
        ylim([-max(abs(segment)) * 1.1, max(abs(segment)) * 1.1]);
    end

    % Figure pour les signaux avec fenêtre rectangulaire
    figure('Name', ['Signal avec Fenêtre Rectangulaire - ', signal_name], 'NumberTitle', 'off');
    title(['Signal Fenêtré pour chaque segment (', signal_name, ')']);

    for i = 1:numSegments
        startIdx = (i - 1) * (windowSize - overlap) + 1;
        endIdx = startIdx + windowSize - 1;
       
        if endIdx > length(data)
            break;
        end

        % Extraction du segment avec fenêtre rectangulaire
        windowed_segment = data(startIdx:endIdx) .* rectwin(windowSize);

        % Afficher le signal fenêtré dans la deuxième figure
        subplot(5, 2, i);  % Organisation en 2 colonnes et 5 lignes
        plot(windowed_segment, 'r', 'LineWidth', 1.5);
        title(['Segment ', num2str(i), ' - Fenêtre Rectangulaire']);
        xlabel('Temps');
        ylabel('Amplitude');
        grid on;
        ylim([-max(abs(windowed_segment)) * 1.1, max(abs(windowed_segment)) * 1.1]);
    end

    % Calcul des caractéristiques
    for i = 1:numSegments
        startIdx = (i - 1) * (windowSize - overlap) + 1;
        endIdx = startIdx + windowSize - 1;

        if endIdx > length(data)
            break;
        end

        % Extraction du segment avec fenêtre
        windowed_segment = data(startIdx:endIdx) .* rectwin(windowSize);
       
        % Calcul de la FFT
        fft_result = fft(windowed_segment);
        fft_magnitude = abs(fft_result / windowSize);
        fft_magnitude = fft_magnitude(1:floor(windowSize/2) + 1);
        f = (0:floor(windowSize/2)) * (fs / windowSize);  % Fréquence
       
        % Extraction des caractéristiques
        [max_amp, max_idx] = max(fft_magnitude);
        max_freq = (max_idx - 1) * (fs / windowSize);
        energy = sum(fft_magnitude.^2);
        std_dev = std(fft_magnitude);
       
        % Stockage des moyennes des caractéristiques
        features(i, :) = [mean(max_amp), mean(max_freq), mean(energy), mean(std_dev)];
    end

    % Affichage des caractéristiques extraites
    figure('Name', ['Caractéristiques Extraites - ', signal_name], 'NumberTitle', 'off');
    title(['Caractéristiques Extraites des Segments (', signal_name, ')']);
    bar(features);
    xlabel('Segment');
    ylabel('Valeurs');
    legend('Amplitude Max', 'Fréquence Max', 'Énergie', 'Écart-type');
    grid on;
    ylim([0, max(features(:)) * 1.1]); % Ajustement de la limite pour les graphiques en barres
end


