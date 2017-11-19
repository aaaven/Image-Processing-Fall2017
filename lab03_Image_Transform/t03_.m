im_origin = imread('images/fence.jpg');
im = rgb2gray(im_origin);                % convert to gray scale   
im_fft = fft2(im);                       %2D DFT
im_fftshift = fftshift(im_fft);          %shift DFT result

[rows,cols] = size(im);
filter = ones(rows,cols);                %construct filter matrix
rows_center = floor(rows/2);
cols_center = floor(cols/2);
h = 40;w = 10;
filter(rows_center-h/2:rows_center+h/2,1:cols_center-w/2) = 0;
filter(rows_center-h/2:rows_center+h/2,cols_center+w/2:cols) = 0;

%apply filter
im_fftshift_filtered = im_fftshift .*filter; 
%inverse fftshift
im_inverse_fftshift = ifftshift(im_fftshift_filtered); 
%inverse fft2
im_inverse_fft = uint8(abs(ifft2(im_inverse_fftshift)));

% imshow()
imwrite(im_inverse_fft,'images/remove_fence.png');




