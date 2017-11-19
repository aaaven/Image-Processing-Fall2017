img = imread('lenna512.bmp');

% imfinfo('lenna512.bmp')
img_inversion = 255 - img;
figure;
imshow(img_inversion)

% colormap cool(256);
% colormap hot(255);
% colormap gray(128);
% colormap gray(64);

% truesize;

