# kmeans-clustering
A from-scratch MATLAB implementation of the k-Means clustering algorithm applied to the Iris dataset.

## Overview
This project implements the **k-Means clustering algorithm from scratch** in MATLAB and applies it to the **Iris dataset**.

The goal is to demonstrate core concepts in **unsupervised machine learning**, including distance-based clustering, centroid updates, and iterative convergence.

## Technologies Used
- **Language:** MATLAB
- **Domain:** Machine Learning / Unsupervised Learning
- **Algorithm:** k-Means Clustering

## Project Structure
- `kMeans.m` – Core k-means algorithm implementation
- `iris.m` – Loads and preprocesses the Iris dataset
- `kmtest.m` – Evaluates clustering results
- `main.m` – Driver script to run the experiment

## How It Works
1. The dataset is loaded and prepared
2. Initial centroids are selected
3. Data points are assigned to the nearest centroid
4. Centroids are recomputed based on cluster assignments
5. Steps 3–4 repeat until convergence
6. Final cluster assignments are evaluated

## How to Run
Run the main script:
```matlab
main
```

Ensure the Iris dataset is accessible to the scripts.

## Academic Context
This project was developed to practice:
- Unsupervised learning algorithms
- Distance-based clustering
- Iterative optimization methods
- Machine learning workflows in MATLAB

## Author
Franck Dipanda
