function [ imo ] = decompress_im( Qmat,QP,N,file_name,rows,cols )

% Read File
entropy_encode=csvread(file_name);

%Entropy/Symbol Decode
im_integer=entropy_dec(entropy_encode);
im_integer=reshape(im_integer,rows,cols);

%Reverse Quantize
S = scalar(QP);
fun1=@(block_struct)(S*Qmat).*block_struct.data;
im_dct2=blockproc(im_integer,[N N],fun1);

%Reverse 2D-DCT
fun2=@(block_struct)idct2(block_struct.data);
imo=blockproc(im_dct2,[N N],fun2);

imo=uint8(imo);

end

