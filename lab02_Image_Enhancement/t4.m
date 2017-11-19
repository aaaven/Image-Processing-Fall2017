im = imread('images/lenna512.bmp');
im_low = imread('images/lenna512_low_dynamic_range.bmp');
im_se = streching_enhancing(im_low,43,211,0,255);
im_eq = histeq(im_low);

mypsnr(im_eq,im)

t4_hist_comparision = figure('Name','Histogram Comparision');
subplot(2,2,1);
plot(imhist(im_low)),title('Low Dynamic Range Image');
subplot(2,2,2);
plot(imhist(im)),title('Original Image');
subplot(2,2,3);
plot(imhist(im_eq)),title('Equalization Enhanced Image');
subplot(2,2,4);
plot(imhist(im_se)),title('Stretch Enhanced Image');

print('images/t4_hist_comparision','-dpng')

histeq_im_comparision = figure('Name','Histogram Equalization Image Comparision');
subplot(2,2,1),imshow(im_low),title('Low Dynamic Range Image');
subplot(2,2,2),imshow(im),title('Original Image');
subplot(2,2,3),imshow(im_eq),title('Equalization Enhanced Image');
subplot(2,2,4),imshow(im),title('Stretch Enhanced Image');

print('images/histeq_im_comparision','-dpng')
