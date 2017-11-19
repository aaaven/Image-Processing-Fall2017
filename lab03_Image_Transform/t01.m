x = 1:256;
fft_x = fft(x);
dct_x = dct(x);
% show x and fft &dct of x
t1_original = figure('Name','Original');
t1_original.OuterPosition = [100 100 1080 420];
subplot(1,3,1),plot(x,'m'),axis([-5,255,-5,255]),title("x");
subplot(1,3,2),plot(fft_x,'r'),grid on, title("DFT");
subplot(1,3,3),plot(dct_x,'g'),grid on, title("DCT");
print('images/t1_original','-dpng');
% reconstruct x with fft fiter32
fft_x_32 = fft_x.*(x <= 32);
x_fft32 = abs(ifft(fft_x_32));
psnr_fft32 = psnr(x_fft32,x,255)
% reconstruct x with dct fiter32
dct_x_32 = dct_x.*(x <= 32);
x_dct32 = abs(idct(dct_x_32));
psnr_dct32 = psnr(x_dct32,x,255)
% show original and reconstructed data with fft and dct filter in one figure
t1_filter32 = figure('Name','FFT vs DCF Reconstruct with filter 32');
t1_filter32.OuterPosition = [100 100 1080 420];
subplot(1,3,1),plot(x,'m'),grid on, title("Original Data");
subplot(1,3,2),plot(x_fft32,'r'),grid on, title("FFT reconstruct with filter 32");
subplot(1,3,3),plot(x_dct32,'g'),grid on,title("DCF reconstruct with filter 32");
print('images/t1_filter32','-dpng');
