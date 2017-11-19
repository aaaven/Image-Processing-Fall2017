figure
n = 2^10;                 % size of mask
M = zeros(n);
I = 1:n; 
x = I-n/2;                % mask x-coordinates 
y = n/2-I;                % mask y-coordinates
[X,Y] = meshgrid(x,y);    % create 2-D mask grid
R = 10;                   % aperture radius
A = (X.^2 + Y.^2 <= R^2); % circular aperture of radius R
M(A) = 1;                 % set mask elements inside aperture to 1
imagesc(M)                % plot mask
axis image

figure
width = 256;
N = width/16;
n = [1:width]-1;
x = 1 + cos(2*pi*n/N);
im = ones(width,1)*x;
image(im)

figure
image(abs(log2(fft2(im))))

figure
image(abs(log2(fftshift(fft2(im)))))

