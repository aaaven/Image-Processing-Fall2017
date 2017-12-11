clear all;close all;

% read and resize image
im_coins_original = imread('images/Coins.jpg');
im_coins = imresize(im_coins_original,0.25);

% binarize image by evaluating hue value
im_hsv = rgb2hsv(im_coins);
im_hue = im_hsv(:,:,2);
im = im_hue > 0.5;

% erosion, fill holes
se = strel('disk',3,0);
im_erosion = imerode(im,se);

% dilation, delete noise 
se = strel('disk',20,0);
im_dilation = imdilate(im_erosion,se);

% plot out all image through process
t1_fig = figure('Name',"Process");
t1_fig.OuterPosition = [100 100 880 420];
subplot(1,4,1),imshow(im_coins),title("Resized Image");
subplot(1,4,2),imshow(im),title("Binarized Image");
subplot(1,4,3),imshow(im_erosion),title("Eroded Image");
subplot(1,4,4),imshow(im_dilation),title("Dilated Image");
print('images/t1_fig','-dpng');

% count numbers
[~, num] = bwlabel(~im_dilation);
num