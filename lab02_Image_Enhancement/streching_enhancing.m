
function y = streching_enhancing(im,x1,x2,y1,y2)
[im_w,im_h] = size(im);
out_im = zeros(im_w,im_h);
for y = 1:im_h
    for x = 1:im_w
        p = double(im(x,y));
        if p < x1
            out_im(x,y) =  p * y1/x1;
        elseif p < x2
            out_im(x,y) = (p - x1)*(y2-y1)/(x2 - x1) + y1;
        else
            out_im(x,y) = (p - x2)*(255-y2)/(255-x2) + y2;
        end
    end
end
y = uint8(out_im);
end