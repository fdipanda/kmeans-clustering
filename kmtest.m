% Name: Franck Dipanda
% Number: 001047147
% Project 1


% K-means on kmtest dataset (no normalization)
clc; clear; close all

% Load the kmtest dataset
km_data = readmatrix('kmtest (1).csv');

% Set K values
K_values = [2 3 4 5];
% Perform K-means clustering for each K value and store results

fprintf('\n Running K-means without normalization \n')
for k = K_values
    [centroids, idx] = kMeans(km_data, k);
    fprintf('K = %d: Cluster centers calculated.\n', k);

% Plotting the clusters
figure;
    gscatter(km_data(:, 1), km_data(:, 2), idx);
    hold on;
    plot(centroids(:, 1), centroids(:, 2), 'kx', 'MarkerSize', 15, 'LineWidth', 3);
    title(['K-means Clustering with K = ' num2str(k)]);
    xlabel('Feature 1');
    ylabel('Feature 2');
    hold off;


end

% K-means on kmtest dataset (z-score normalization)
fprintf('\n Running K-means with normalization \n')

% Normalize the data using z-score normalization
normalized_data = zscore(km_data);
for k = K_values
    [centroids, idx] = kMeans(normalized_data, k);
    fprintf('K = %d: Cluster centers calculated.\n', k);

    % Plotting the clusters
    figure;
    gscatter(normalized_data(:, 1), normalized_data(:, 2), idx);
    hold on;
    plot(centroids(:, 1), centroids(:, 2), 'kx', 'MarkerSize', 15, 'LineWidth', 3);
    title(['K-means Clustering with Normalization, K = ' num2str(k)]);
    xlabel('Feature 1 (Normalized)');
    ylabel('Feature 2 (Normalized)');
    hold off;
end

