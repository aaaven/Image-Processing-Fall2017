function im_binary= binarize(im,threshold)
[r,c,dim] = size(im);
% Convert RGB to Gray Scale
if dim == 3
    im = rgb2gray(im);
else
  sprintf('im has to be rgb image');
end
% Binarize Image
im_binary = zeros(r,c);
 for i=1:r
   for j=1:c
         if(im(i,j)) < threshold
             im_binary(i,j) = 0;
         else
             im_binary(i,j) = 1;
         end
     end
 end
% im_binary = im > threshold;
end