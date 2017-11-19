im = imread('images/lenna512.bmp');
im_wn = imread('images/lenna512_AWGN.bmp');
im_sp = imread('images/lenna512_SandP.bmp');
im_low = imread('images/lenna512_low_dynamic_range.bmp');


mypsnr(im,im_wn)
mypsnr(im,im_sp)
mypsnr(im,im_low)

t2_hist_comparison = figure('Name','Histogram Comparison')
subplot(2,2,1)
plot(imhist(im)),title('Reference')

subplot(2,2,2)
plot(imhist(im_wn)),title('AWGN')

subplot(2,2,3)
plot(imhist(im_sp)),title('SandP')

subplot(2,2,4)
plot(imhist(im_low)),title('Low Dynamic Range')

print('images/t2_hist_comparison','-dpng')