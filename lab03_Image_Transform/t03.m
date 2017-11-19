im_origin = imread('images/fence.jpg');
im = rgb2gray(im_origin);                % convert to gray scale   

figure;
imshow(im);                             % show image with scale

fig = figure;
fig.OuterPosition = [100 100 1000,300];
im_fft = fft2(im);                       %2D DFT
im_fftshift = fftshift(im_fft);          %shift DFT result
im_log = log2(1 + im_fftshift);          %Log magnitude

subplot(1,3,1),imagesc(abs(fft2(im))),title('DFT Image');          
subplot(1,3,2),imagesc(fftshift(abs(fft2(im)))),title('Shift DFT Image');
subplot(1,3,3),imagesc(log2(1 + fftshift(abs(fft2(im))))),title('Log Maganitude of DFT Image');
print('images/t03_dft','-dpng');

[rows,cols] = size(im);
filter = ones(rows,cols);
rows_center = floor(rows/2);
cols_center = floor(cols/2);
h = 20;w = 30;
filter(rows_center-h/2:rows_center+h/2,1:cols_center-w/2) = 0;
filter(rows_center-h/2:rows_center+h/2,cols_center+w/2:cols) = 0;

figure;
imagesc(filter);
print('images/t03_filter','-dpng');

figure;
im = log2(1 + fftshift(abs(fft2(im))));
im_log_filter = im.*filter;
imagesc(im_log_filter);
print('images/im_log_filter','-dpng');

im_fftshift_filtered = im_fftshift .*filter;
im_inverse_fftshift = ifftshift(im_fftshift_filtered); 
im_inverse_fft = abs(ifft2(im_inverse_fftshift));

fig = figure;
fig.OuterPosition = [100 100 1000,300];
subplot(1,3,1),imagesc(abs(im_fftshift_filtered)),title('Applied Filter');          
subplot(1,3,2),imagesc(abs(im_inverse_fftshift)),title('Inverse fftshift');
subplot(1,3,3),imagesc(im_inverse_fft),title('Inverse fft2');
print('images/t03_inverse','-dpng');

