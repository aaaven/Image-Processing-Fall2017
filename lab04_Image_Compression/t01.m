clear;clc;

% generate Qmat
Qmat = gen_qmat(16);

% Huffman compression
[Huffman_dictionary,CR,imc] = Huffman_compress(Qmat);

% Huffman decompression 
imo = Huffman_decompression(Huffman_dictionary,imc);

