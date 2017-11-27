function [Huffman_dictionary,CR,imc] = Huffman_compress(im)

%count symbols and calculate probability
symbols = tabulate(im(:));

%delete 0 amount
symbols(symbols(:,2)==0,:)=[];

% sort by probability
symbols = sortrows(symbols,3);

%build Huffman tree and assign code
[rows,cols]=size(symbols);
code = cell(rows,1);
code{1} = '0';
code{2} = '1';

assigned_p_sum = symbols(1,3) + symbols(2,3);

for i = 3:rows
    j = i -1;
    if symbols(i,3) > assigned_p_sum
         code(i) = strcat('1',code(i));   
         code(1:j) = strcat('0',code(1:j));
    else
         code(i) = strcat('0',code(i));
         code(1:j) = strcat('1',code(1:j));
    end
    assigned_p_sum = assigned_p_sum + symbols(i,3);
end

% calculate dictinary average length
average_len = 0; 
for index = 1 : rows
    p = symbols(index,3) * 0.01;
    len = length(cell2mat(code(index)));
    average_len = average_len + p * len;
end

%prepare dictionary output
Huffman_dictionary = [num2cell(symbols(:,1)), code(:)];
Huffman_dictionary = sortrows(Huffman_dictionary,1);

% image compression
[im_rows,im_cols] = size(im);
imc = cell(im_rows,im_cols);

for m = 1:im_rows
    for n = 1:im_cols
        pixel_value = im(m,n);
        imc(m,n) = Huffman_dictionary(cell2mat(Huffman_dictionary(:,1)) == pixel_value,2);
    end
end

%calculate the compression ratio
CR = 8/average_len;

end

