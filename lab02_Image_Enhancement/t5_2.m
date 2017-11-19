im = imread('images/lenna512.bmp');
im_wn = imread('images/lenna512_AWGN.bmp');


filter_3_4 = [3/33,5/33,3/33;
              5/33,1/33,5/33;
              3/33,5/33,3/33];
          
filter_3_5 = [3/41,7/41,3/41;
              7/41,1/41,7/41;
              3/41,7/41,3/41];
          
filter_3_6 = [5/49,7/49,5/49;
              7/49,1/49,7/49;
              5/49,7/49,5/49];
          
          
im_filter_3_4 = imfilter(im_wn,filter_3_4);
im_filter_3_5 = imfilter(im_wn,filter_3_5);
im_filter_3_6 = imfilter(im_wn,filter_3_6);


mypsnr(im,im_filter_3_4)
mypsnr(im,im_filter_3_5)
mypsnr(im,im_filter_3_6)

t5_2_im_comparision = figure('Name','Image Comparision');
subplot(2,2,1),imshow(im_wn),title('Image with Noise');
subplot(2,2,2),imshow(im_filter_3_4),title('3*3 filter 4');
subplot(2,2,3),imshow(im_filter_3_5),title('3*3 filter 5');
subplot(2,2,4),imshow(im_filter_3_6),title('3*3 filter 6');
print('images/t5_2_im_comparision','-dpng')