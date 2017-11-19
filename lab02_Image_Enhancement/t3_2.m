im = imread('images/lenna512.bmp');
im_low = imread('images/lenna512_low_dynamic_range.bmp');
im_se = streching_enhancing(im_low,43,211,0,255);
im_se_20_230 = streching_enhancing(im_low,20,230,0,255);
im_se_30_220 = streching_enhancing(im_low,30,220,0,255);
im_se_50_200 = streching_enhancing(im_low,50,200,0,255);
im_se_60_190 = streching_enhancing(im_low,60,190,0,255);


hist_different_se_range = figure('Name','Different Strech Enhancing Range Comparision');
subplot(3,2,1);
plot(imhist(im_se_20_230)),title('Range[20,230]');
subplot(3,2,2);
plot(imhist(im_se_30_220)),title('Range[30,220]');
subplot(3,2,3);
plot(imhist(im_se)),title('Range[43,211]');
subplot(3,2,4);
plot(imhist(im)),title('Reference');
subplot(3,2,5);
plot(imhist(im_se_50_200)),title('Range[50:200]');
subplot(3,2,6);
plot(imhist(im_se_60_190)),title('Range[60,190]');
print('images/hist_different_se_range','-dpng')

im_different_se_range = figure('Name','Different Strech Enhancing Range Comparision');
subplot(3,2,1),imshow(im_se_20_230),,title('Range[20,230]');
subplot(3,2,2),imshow(im_se_30_220),title('Range[30,220]');
subplot(3,2,3),imshow(im_se),title('Range[43,211]');
subplot(3,2,4),imshow(im),title('Reference');
subplot(3,2,5),imshow(im_se_50_200),title('Range[50:200]');
subplot(3,2,6),imshow(im_se_60_190),title('Range[60,190]');
print('images/im_different_se_range','-dpng')