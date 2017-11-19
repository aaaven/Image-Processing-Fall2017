im = imread('images/lenna512.bmp');
im_sp = imread('images/lenna512_SandP.bmp');

im_median_3_3 = medfilt2(im_sp,[3,3]);
im_median_5_5 = medfilt2(im_sp,[5,5]);

average_filter_3_3 = [1/9,1/9,1/9;
                      1/9,1/9,1/9;
                      1/9,1/9,1/9];
im_average = imfilter(im_sp,average_filter_3_3);

mypsnr(im_median_3_3,im)
mypsnr(im_median_5_5,im)
mypsnr(im_average,im)


t6_im_comparision = figure('Name','Image Comparision');
subplot(2,2,1),imshow(im_sp),title('im\_sp');
subplot(2,2,2),imshow(im_median_3_3),title('im\_median\_3\_3');
subplot(2,2,3),imshow(im_median_5_5),title('im\_median\_5\_5');
subplot(2,2,4),imshow(im_average),title('average\_filter\_3\_3');
print('images/t6_im_comparision','-dpng')