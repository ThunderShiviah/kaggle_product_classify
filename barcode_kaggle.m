% This script shows how to plot barcodes directly to a file

clc; clear; close all;

max_dimension = 2;
max_filtration_value = 100;
num_divisions = 100;

% create the set of points
point_cloud = csvread('small_temp.csv');

% create a Vietoris-Rips stream 
stream = api.Plex4.createVietorisRipsStream(point_cloud, max_dimension + 1, max_filtration_value, num_divisions);

% get the default persistence algorithm
persistence = api.Plex4.getDefaultSimplicialAlgorithm(max_dimension);

% this initially creates a set of intervals which contains the filtration values
filtration_value_intervals = persistence.computeIntervals(stream);

% set plot options - plot in eps format
options.filename = 'house-barcodes';
options.file_format = 'eps';
options.caption = 'House Example'

% create the barcode plots
plot_barcodes(filtration_value_intervals, options)
