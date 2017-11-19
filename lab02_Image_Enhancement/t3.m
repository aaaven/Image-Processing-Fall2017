im = imread('images/lenna512.bmp');
im_low = imread('images/lenna512_low_dynamic_range.bmp');
im_se = streching_enhancing(im_low,43,211,0,255);

mypsnr(im_se,im)

im_comparision = figure('Name','Image Comparision');
imshowpair(im_low,im_se,'montage'),
title('Low Dynamic Range Image vs. Streching Enhanced Image (with Max PSNR)')
print('images/im_comparision', '-dpng')

t3_hist_comparision = figure('Name','Histogram Comparision');
subplot(1,3,1);
plot(imhist(im_low)),title('Low Dynamic Range Image');
subplot(1,3,2);
plot(imhist(im_se)),title('Stench Enhanced Image');
subplot(1,3,3);
plot(imhist(im)),title('Original Image');
print('images/t3_hist_comparision','-dpng')
