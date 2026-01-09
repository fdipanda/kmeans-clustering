% Name: Franck Dipanda
% Number: 001047147
% Project 1


clc; clear; close all


% Load the datasets
km_data = readmatrix('kmtest (1).csv');
iris_data = readmatrix('iris .csv');

% Display the first few rows of each dataset to verify loading
disp('kmtest shape ->');
disp(size(km_data));
disp('first rows of kmtest:');
disp(head(km_data));
disp('iris shape ->');
disp(size(iris_data));
disp('first rows of iris:');
disp(head(iris_data));

% Plotting the datasets to ensure they loaded correctly

figure;
scatter(km_data(:, 1), km_data(:, 2), 25, 'filled');
title('kmtest Data');
xlabel('Feature 1');
ylabel('Feature 2');
grid on

figure;
scatter(iris_data(:, 3), iris_data(:, 4), 25, 'filled');
title('Iris Data');
xlabel('Petal Length');
ylabel('Petal Width');
grid on;