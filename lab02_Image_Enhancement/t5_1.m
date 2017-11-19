im = imread('images/lenna512.bmp');
im_wn = imread('images/lenna512_AWGN.bmp');

% 3*3 filter
filter_3_1 = [1/17,3/17,1/17;
              3/17,1/17,3/17;
              1/17,3/17,1/17];

filter_3_2 = [1/25,5/25,1/25;
              5/25,1/25,5/25;
              1/25,5/25,1/25];

filter_3_3 = [1/33,7/33,1/33;
              7/33,1/33,7/33;
              1/33,7/33,1/33];

          
im_filter_3_1 = imfilter(im_wn,filter_3_1);
im_filter_3_2 = imfilter(im_wn,filter_3_2);
im_filter_3_3 = imfilter(im_wn,filter_3_3);

mypsnr(im,im_filter_3_1)
mypsnr(im,im_filter_3_2)
mypsnr(im,im_filter_3_3)

t5_1_im_comparision = figure('Name','Image Comparision');
subplot(2,2,1),imshow(im_wn),title('Image with Noise');
subplot(2,2,2),imshow(im_filter_3_1),title('3*3 filter 1');
subplot(2,2,3),imshow(im_filter_3_2),title('3*3 filter 2');
subplot(2,2,4),imshow(im_filter_3_3),title('3*3 filter 3');
print('images/t5_1_im_comparision','-dpng')
