function [rate_PSNR] = Rate_PSNR(im,QP,N)
%genetate N Qmat
Qmat = gen_qmat(N);

%Get Image Size 
[rows,cols] = size(im);

% Compress
file_name = 'imc_N' + string(N) + '_QP' + string(QP) + '.dat';
file_name = char(file_name);
rate = compress_im(im,Qmat,QP,N,file_name);

% Decompress
imo = decompress_im(Qmat,QP,N,file_name,rows,cols);
PSNR = psnr(im,imo,255);

% Save Figure of Comparision of Original and Recovered Image 
figure_name = 'images/t04/N' + string(N) + '_QP' + string(QP);
figure_name = char(figure_name);
plot_name = char('N' + string(N) + '\_QP' + string(QP));
fig = figure('Name','Original vs. Recovered Image');
fig.OuterPosition = [100 100 1084 572];
subplot(1,2,1),imshow(im),title('Original Image');
subplot(1,2,2),imshow(imo),title(plot_name);
print(figure_name,'-dpng');

rate_PSNR = [rate, PSNR];
end