% Name: Franck Dipanda
% Number: 001047147
% Project 1


function [centers, labels] = kMeans(X, k, max_iter)

if nargin < 3
    max_iter = 100; % Set default maximum iterations if not provided
end

n=size(X,1);
d=size(X,2);

% Randomly select our k points for the initial centroids
randomIndices = randperm(n, k); % Randomly select k unique indices
centers = X(randomIndices, :);   % Initialize centroids using the selected points

labels = zeros(n, 1); % Initialize labels for each data point
for iter = 1:max_iter
    % Assign labels based on the closest centroid
    distances = pdist2(X, centers); % Compute distances from points to centroids
    [~, labels] = min(distances, [], 2); % Assign labels based on closest centroid
    new_centers = zeros(k,d);

% Update centroids by calculating the mean of the assigned points
for j = 1:k
    pts = X(labels == j, :);
    if ~isempty(pts)
        new_centers(j, :) = mean(pts, 1); % Update the centroid to the mean of assigned points
    else
        new_centers(j, :) = centers(j, :); % Keep the old centroid if no points are assigned
    end
end

% Check for convergence
if all(abs(new_centers - centers) < 1e-6, 'all')
    disp(['Converged at Iteration ', num2str(iter)])
    break; % Exit the loop if convergence is achieved
end
centers=new_centers;
end
end
