function y = recover_image( im_DCT,DCT_bases )
out = zeros(4);
for i = 1:4
    for j = 1:4
        out = out + im_DCT(i,j)*DCT_bases{i,j};
    end
end
y = out;
end

