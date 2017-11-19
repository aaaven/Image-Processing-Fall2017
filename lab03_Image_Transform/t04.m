im = imread('images/lenna512.bmp');
im_440 = imread('images/lenna_ds440.bmp');
im_420 = imread('images/lenna_ds420.bmp');

% zero padding
im_zp_440 = zeroPadding(im_440,512,512);
imwrite(im_zp_440,'images/im_zp_440.png');
psnr_zp_440 = psnr(im_zp_440,im,255)

im_zp_420 = zeroPadding(im_420,512,512);
imwrite(im_zp_420,'images/im_zp_420.png');
psnr_zp_420 = psnr(im_zp_420,im,255)

% nearest
im_nearest_440 = imresize(im_440,[512 512],'nearest');
imwrite(im_nearest_440,'images/im_nearest_440.png');
psnr_nearest_440 = psnr(im_nearest_440,im,255)

im_nearest_420 = imresize(im_420,[512 512],'nearest');
imwrite(im_nearest_420,'images/im_nearest_420.png');
psnr_nearest_420 = psnr(im_nearest_420,im,255)

% lanczos3
im_lanczos3_440 = imresize(im_440,[512 512],'lanczos3');
imwrite(im_lanczos3_440,'images/im_lanczos3_440.png');
psnr_lanczos3_440 = psnr(im_lanczos3_440,im,255)

im_lanczos3_420 = imresize(im_420,[512 512],'lanczos3');
imwrite(im_lanczos3_420,'images/im_lanczos3_420.png');
psnr_lanczos3_420 = psnr(im_lanczos3_420,im,255)