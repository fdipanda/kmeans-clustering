% Name: Franck Dipanda
% Number: 001047147
% Project 1


% K-means on iris dataset

fprintf('\n Running K-means on Iris dataset (K=3) \n');

% Load the iris dataset
iris_table = readtable('iris .csv');
% Extract features for clustering
features = table2array(iris_table(:, 1:4)); %makes sure to properly import the text labels 
orig_labels = categorical(iris_table{:,5});    

runs = 5; %run 5 times
k =3;
results = cell(runs, 2); %store both centers and labels

for i = 1:runs
    rng(i);  % randomizes seed for each iteration
    [clusterCenters, clusterLabels] = kMeans(features, k);
    results{i, 1} = clusterCenters;
    results{i, 2} = clusterLabels;
end

% Analyze the results and compute the best and worst clustering runs

X = features;

distortions = zeros(runs,1);

for i = 1:runs
    centers = results{i,1};
    labels = results{i,2};
    d=0;

    for j = 1:k
        cluster_pts = X(labels ==j, :);
        if ~isempty(cluster_pts)
            d = d +sum(sum((cluster_pts - centers(j,:)).^2));
        end
    end

    distortions(i) = d; % store the distortion
end

[bestDistortion, bestRun] = min(distortions); % find the best clustering run
[worstDistortion, worstRun] = max(distortions); % find the worst clustering run


% Display the results
fprintf('Best Run: %d with Distortion: %.4f\n', bestRun, bestDistortion);
fprintf('Worst Run: %d with Distortion: %.4f\n', worstRun, worstDistortion);

% Plot the distortions for the bes & worst runs

bestCenters = results{bestRun, 1};
bestLabels = results{bestRun, 2};

worstCenters = results{worstRun,1};
worstLabels = results{worstRun,2};

figure
gscatter(X(:,3), X(:,4), bestLabels)
hold on
plot(bestCenters(:,3), bestCenters(:,4), 'kx', 'MarkerSize',12,'LineWidth',2)
title(sprintf('Best Run #%d     (K=3)', bestRun))
xlabel('Petal Length'); ylabel('Petal Width'); grid on

figure
gscatter(X(:,3), X(:,4), worstLabels)
hold on
plot(worstCenters(:,3), worstCenters(:,4), 'kx', 'MarkerSize',12,'LineWidth',2)
title(sprintf('Worst Run #%d     (K=3)', worstRun))
xlabel('Petal Length'); ylabel('Petal Width'); grid on


% Plot the original label to compare
  
figure
gscatter(X(:,3), X(:,4), orig_labels)
title('Original Iris Labels (Attributes 3 & 4)')
xlabel('Petal Length'); ylabel('Petal Width'); grid on


% Finally, finding the distance between best cluster centers and actual
% class centers

unique_labels = unique(orig_labels);
num_classes = numel(unique_labels);

% Calculate the actual class centers for comparison
actualCenters = zeros(num_classes, size(X,2));

for i = 1:num_classes
    class_pts = X(ismember(orig_labels, unique_labels(i)), :);
    actualCenters(i, :) = mean(class_pts, 1); % calculate the mean for each class
end

distMatrix = pdist2(actualCenters, bestCenters);

% Display the distance matrix for analysis
disp('Distance Matrix between Actual Class Centers and Best Cluster Centers:');
disp(distMatrix);