img = imread('lenna512.bmp');

img_crop = imcrop(img);
figure;
imshow(img)
imwrite(img_crop,'lenna_crop.png');

