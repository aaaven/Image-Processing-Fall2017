width = 256;
N = width/16;
n = [1:width]-1;
x = 1 + cos(2*pi*n/N);
im = ones(width,1)*x;

t2_a = figure('Name','Original IM');
imagesc(im);
print('images/t2_a','-dpng');

t2_b1 = figure('Name','log of magnitude of 2D-DFT');
imagesc(log2(abs(fft2(im))));
print('images/t2_b1','-dpng');

t2_b2 = figure('Name','log of magnitude of fftshift 2D-DFT');
imagesc(log2(abs(fftshift(fft2(im)))));
print('images/t2_b2','-dpng');

