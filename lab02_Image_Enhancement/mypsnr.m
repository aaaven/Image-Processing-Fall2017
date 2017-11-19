
function y = mypsnr(im,im2)
the_mse = mymse(im,im2);
y = 10 * log10(255^2/the_mse);
end

function y = mymse(im,im2)
[im_w,im_h] = size(im);
err = 0.0;
for im_y = 1:im_h
    for im_x = 1:im_w
       err = err + (double(im(im_x,im_y))-double(im2(im_x,im_y)))^2;
    end
end
y = err/(im_w*im_h);
end
