function imo = Huffman_decompression(Huffman_dictionary,imc)

[rows,cols]=size(imc);
imo = zeros(rows,cols);

for i = 1 : rows
    for j = 1 : cols
        pixel_code = imc(i,j);
        imo(i,j) = cell2mat(Huffman_dictionary(strcmp(Huffman_dictionary(:,2),pixel_code),1));
    end
end
end

