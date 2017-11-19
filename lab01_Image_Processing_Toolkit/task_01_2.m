img = imread('lenna512.bmp');

% imfinfo('lenna512.bmp')
img_inversion = 255 - img;
figure;
imshow(img_inversion)
imwrite(img_inversion,'lenna_inversion.png')