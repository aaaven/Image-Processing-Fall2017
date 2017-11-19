im = imread('images/lenna512.bmp');
im_wn = imread('images/lenna512_AWGN.bmp');

          
filter_3_7 = [7/65,9/65,7/65;
              9/65,1/65,9/65;
              7/65,9/65,7/65];
          
filter_3_8 = [11/97,13/97,11/97;
              13/97,1/97,13/97;
              11/97,13/97,11/97];
          
filter_3_9 = [19/161,21/161,19/161;
              21/161,1/161,21/161;
              19/161,21/161,19/161];

          
im_filter_3_7 = imfilter(im_wn,filter_3_7);
im_filter_3_8 = imfilter(im_wn,filter_3_8);
im_filter_3_9 = imfilter(im_wn,filter_3_9);


mypsnr(im,im_filter_3_7)
mypsnr(im,im_filter_3_8)
mypsnr(im,im_filter_3_9)