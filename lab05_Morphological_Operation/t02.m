clc;clear;close all;

%%% Image Preprocess

% read image
im = imread('images/car_license_plate.png');
im_temp = imread('images/alphanumeric_templates.png');
% Get the threshold value
thresh = graythresh(im);
thresh_temp = graythresh(im_temp);
% Binarize image
im = binarize(im,thresh*255);
im_temp = binarize(im_temp,thresh_temp*255);
% Crop out Chinese char
im = imcrop(im,[160,40,460,80]);
im_temp = imcrop(im_temp,[45,40,1040,490]);

figure;imshow(im);
figure;imshow(im_temp);

%%% Image Reconganition
% task 01
license_01 = detect_car_license_plate_v1(im,im_temp)
% task 02
license_02 = detect_car_license_plate_v2(im,im_temp)