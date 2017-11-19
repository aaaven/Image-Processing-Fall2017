im = imread('images/lenna512.bmp');
im_wn = imread('images/lenna512_AWGN.bmp');

% 5*5 filter
filter_5_1 = [1/41,1/41,1/41,1/41,1/41;
              1/41,3/41,3/41,3/41,1/41;
              1/41,3/41,1/41,3/41,1/41;
              1/41,3/41,3/41,3/41,1/41;
              1/41,1/41,1/41,1/41,1/41];
              
filter_5_2 = [1/57,1/57,1/57,1/57,1/57;
              1/57,5/57,5/57,5/57,1/57;
              1/57,5/57,1/57,5/57,1/57;
              1/57,5/57,5/57,5/57,1/57;
              1/57,1/57,1/57,1/57,1/57];
          
filter_5_3 = [1/73,1/73,1/73,1/73,1/73;
              1/73,7/73,7/73,7/73,1/73;
              1/73,7/73,1/73,7/73,1/73;
              1/73,7/73,7/73,7/73,1/73;
              1/73,1/73,1/73,1/73,1/73];
          
im_filter_5_1 = imfilter(im_wn,filter_5_1);
im_filter_5_2 = imfilter(im_wn,filter_5_2);
im_filter_5_3 = imfilter(im_wn,filter_5_3);

mypsnr(im,im_filter_5_1)
mypsnr(im,im_filter_5_2)
mypsnr(im,im_filter_5_3)

t5_3_im_comparision = figure('Name','Image Comparision');
subplot(2,2,1),imshow(im_wn),title('Image with Noise');
subplot(2,2,2),imshow(im_filter_5_1),title('5*5 filter 1');
subplot(2,2,3),imshow(im_filter_5_2),title('5*5 filter 2');
subplot(2,2,4),imshow(im_filter_5_3),title('5*5 filter 3');
print('images/t5_3_im_comparision','-dpng')