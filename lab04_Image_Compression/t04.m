clear;clc;

%Read Image 
im = imread('images/lenna512.bmp');

% Init Rate_PSNR
Rate_PSNR_16 = zeros(2,8);
Rate_PSNR_8 = zeros(2,8);
Rate_PSNR_jpg = zeros(2,8);

% Calculate Bit Rate and PSNR
i = 1;
while i <= 8 %loop through all QR
    QP = 1 + 14*(i-1);
    
%when N = 16
    N = 16;
    Rate_PSNR_16(:,i) = Rate_PSNR(im,QP,N);

%when N = 8
    N = 8;
    Rate_PSNR_8(:,i) = Rate_PSNR(im,QP,N);
    
%Use Jpeg Method     
    file_name = 'images/t04/lenna_jpeg_QP' + string(QP) + '.jpg';
    file_name = char(file_name);
    imwrite(im,file_name,'Quality',QP);
    im_jpeg = imread(file_name);
    Rate_PSNR_jpg(:,i) = [fsize(file_name)*8/(rows*cols),psnr(im,im_jpeg)];
   
    i = i + 1;
end

% Save Figure of Comparision of N = 16 and Jpeg method
t04_Rate_PSNR = figure('Name','Bit Rate verse PSNR Evaluation');
plot(Rate_PSNR_16(1,:),Rate_PSNR_16(2,:),'m',Rate_PSNR_jpg(1,:),Rate_PSNR_jpg(2,:),'g');
legend('N = 16','JPEG');title('Bit Rate verse PSNR Evaluation');
xlabel('Bit Rate');ylabel('PSNR');
print('images/t04_Rate_PSNR','-dpng');

% Save Figure of Comparision of N = 16 and N = 8
t04_Rate_PSNR2 = figure('Name','Bit Rate verse PSNR Evaluation');
plot(Rate_PSNR_16(1,:),Rate_PSNR_16(2,:),'m',Rate_PSNR_8(1,:),Rate_PSNR_8(2,:),'b');
legend('N = 16','N = 8');title('Bit Rate verse PSNR Evaluation');
xlabel('Bit Rate');ylabel('PSNR');
print('images/t04_Rate_PSNR2','-dpng');




