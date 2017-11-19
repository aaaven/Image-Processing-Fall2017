function y = projection_an_image_on_its_DCT_bases(im,DCT_bases)
im_1D = reshape(im,1,16);
coefficients = zeros(4);
for i = 1:4
     for j = 1:4
        the_base_1D = reshape(DCT_bases{i,j},1,16);
        C = dot(im_1D,the_base_1D)/dot(the_base_1D,the_base_1D);
        coefficients(i,j) = C;
     end
end
y = coefficients;
end

