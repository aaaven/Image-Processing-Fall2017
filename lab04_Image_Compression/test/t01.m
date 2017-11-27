clear;clc;

im = imread('images/lenna512.bmp');
% huffman compression
% [Huffman_dictionary,CR,imc] = Huffman_compress(im);
% huffman decompression
% imo = Huffman_decompression(Huffman_dictionary,imc);

Qmat = gen_qmat(16);
[Huffman_dictionary_,CR,imc] = Huffman_compress(Qmat);

