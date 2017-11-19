im = imread('images/lenna512.bmp');
im_low = imread('images/lenna512_low_dynamic_range.bmp');

sePSNR = zeros(128,128);

for a = [1:1:128]
    for b = [128:1:255]
%         t = [a:1:b]
        im_se = streching_enhancing(im_low,a,b,0,255);
        sePSNR(a,b-127) = mypsnr(im_se,im);
    end
end