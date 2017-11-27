clear;clc;

%genetate N = 16 Qmat
N = 16;
Qmat = gen_qmat(N);

%Read Image 
im = imread('images/lenna512.bmp');
[rows,cols] = size(im);

% Compress
QP = 50;
fileName = 'imc.dat';
rate = compress_im(im,Qmat,QP,N,fileName);

% Decompress
imo = decompress_im(Qmat,QP,N,fileName,rows,cols);

t03_out = figure('Name','Original vs. Recovered Image');
subplot(1,2,1),imshow(im),title('Original Image');
subplot(1,2,2),imshow(imo),title('Recovered Image');
print('images/t3_out','-dpng');

psnr = psnr(im,imo,255);

