function [rate]=compress_im(im,Qmat,QP,N, file_name)

% a) 2D-DCT
fun=@(block_struct)dct2(block_struct.data);
im_dct2=blockproc(im,[N N],fun);

% b) Quantize
S = scalar(QP);
fun1=@(block_struct)round(block_struct.data./(S*Qmat));
im_integer= blockproc(im_dct2,[N N],fun1);

% c)Entropy/Symbol Encode
entropy_encode=entropy_enc(im_integer);

% d)Save/Write
csvwrite(file_name,entropy_encode);

% e)Calculate Bit Rate
[rows,cols]=size(im);
bits=fsize(file_name);
rate=bits*8/(rows*cols);

end

