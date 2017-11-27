% t01_, for testing other different approaches

% im = imread('images/lenna512.bmp');
% [rows,cols] = size(im);
% im_1D = reshape(im,rows*cols,1);


Qmat = gen_qmat(16);
[rows,cols] = size(Qmat);
Qmat_1D = reshape(Qmat,rows*cols,1);

code = huffman(Qmat_1D)