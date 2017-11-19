width = 256;
N = width/8;
n = [1:width]-1;
x = 1 + cos(2*pi*n/N);
im = ones(width,1)*x;

t2_c1 = figure('Name','Original IM');
imagesc(im);
print('images/t2_c1','-dpng');

t2_c2 = figure('Name','log of magnitude of 2D-DFT');
imagesc(log2(abs(fft2(im))));
print('images/t2_c2','-dpng');

t2_c3 = figure('Name','log of magnitude of fftshift 2D-DFT');
imagesc(log2(abs(fftshift(fft2(im)))));
print('images/t2_c3','-dpng');

