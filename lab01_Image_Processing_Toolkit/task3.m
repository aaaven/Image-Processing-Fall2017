img = imread('lenna512.bmp');

img_quantization = floor(img/16);
img_quantization = img_quantization*15 + 15

imwrite(img_quantization,'img_quantization.png')