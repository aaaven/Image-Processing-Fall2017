function [Huffman_dictionary,CR,imc] = Huffman_compress(im)

%current symbols and probability
symbols = 0:255;
hist = imhist(im);
p = hist/sum(hist);%normalize histgram and probability                  
% tabulate

%get huffman dictionary
[Huffman_dictionary,avglen] = huffmandict(symbols,p);
CR = 8/avglen;

%get imc
[w,h] = size(im);
% imc = cell(w,h);
% for i = 1:w
%     for j = 1:h
%         pixel_value = im(i,j);
%         imc(i,j) = Huffman_dictionary(pixel_value,2);
%     end
% end
imc_1D = Huffman_dictionary(im(:,:),2);
imc = reshape(imc_1D,w,h);
end