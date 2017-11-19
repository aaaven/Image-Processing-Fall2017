function y = zeroPadding(im,target_w,target_h)
fft_im = fftshift(fft2(im));
out = zeros(target_h,target_w);

[w,h] = size(im);
t_h = floor(0.5*(target_h - h));
t_w = floor(0.5*(target_w - w));
% apply original DFT to center of this zero
out(t_w + 1 : w + t_w, t_h + 1 : h + t_h) = fft_im;
% scale up
scale = target_w*target_h/(w*h);
out_scale = out*scale;
out_inverse = uint8(abs(ifft2(ifftshift(out_scale))));
y = out_inverse;
end