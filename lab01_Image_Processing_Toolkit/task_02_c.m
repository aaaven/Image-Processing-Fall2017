img = imread('lenna512.bmp');
downSamplingRatio = 1/2;
upSamplingRation = 2;
img_bilinear_downSamping = imresize(img,downSamplingRatio,'bilinear');
img_bicubic_downSamping = imresize(img,downSamplingRatio,'bicubic');

imwrite(img_b_downSamping,'lenna_bilinear_downSampling.png');
imwrite(img_bic_downSamping,'lenna_bicubic_downSampling.png');

img_bilinear_upSampling = imresize(img_bilinear_downSamping,upSamplingRation,'bilinear');
img_bicubic_upSampling = imresize(img_bicubic_downSamping,upSamplingRation,'bicubic');

imwrite(img_bilinear_upSampling,'lenna_bilinear_upSampling.png');
imwrite(img_bicubic_upSampling,'lenna_bicubic_upSampling.png');


[peaksnr, snr] = psnr(img_bilinear_upSampling, img);
[peaksnr, snr] = psnr(img_bicubic_upSampling, img);


