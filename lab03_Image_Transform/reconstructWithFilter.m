function y = reconstructWithFilter(filter)
x = 1:256;
fft_x = fft(x);
dct_x = dct(x);
% reconstruct x with fft fiter32
x_fft = abs(ifft(fft_x.*(x <= filter)));
psnr_fft = psnr(x_fft,x,255);
% reconstruct x with dct fiter32
x_dct = abs(idct(dct_x.*(x <= filter)));
psnr_dct = psnr(x_dct,x,255);
% show original and reconstructed data with fft and dct filter in one figure
fig = figure('Name','FFT vs DCF Reconstruct with filter');
fig.OuterPosition = [100 100 1080 420];
subplot(1,3,1),plot(x,'m'),title("Original Data");
subplot(1,3,2),plot(x_fft,'r'),title("FFT reconstruct with filter " + filter);
subplot(1,3,3),plot(x_dct,'g'),title("DCF reconstruct with filter " + filter);
print('images/reconstructWithFilter', '-dpng');
y = [psnr_fft,psnr_dct];
end