img = imread('lenna512.bmp');
img_nn_upSampling = imread('lenna_upSampling.png');
img_bilinear_upSampling = imread('lenna_bilinear_upSampling.png');
img_bicubic_upSampling = imread('lenna_bicubic_upSampling.png');

psnr_nn = psnr(img_nn_upSampling, img)
psnr_bilinear = psnr(img_bilinear_upSampling, img)
psnr_bicubic = psnr(img_bicubic_upSampling, img)
