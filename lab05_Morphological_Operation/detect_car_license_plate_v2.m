function str = detect_car_license_plate_v2(im,im_temp)

% Split license and templete
im_num = segmentation(im,'license2_');
temp_num = segmentation(im_temp,'temp_fg_');

% Build dictionary
character=char('A','0','5','K','U','6','1','B','V','L','W','2','7',...
    'M','C','3','8','X','D','N','4','9','Y','O','E','Z','F','P','G',...
    'Q','H','R','S','I','J','T');

% Structuring elements 
SE1 = strel('square',3);
SE2 = strel('square',5);

% generate and save fg and bg
for k=1:temp_num
    im_temp_splited = double(imread(sprintf('temp_fg_%d.bmp',k)));
    im_fg = imerode(im_temp_splited,SE1);
    imwrite(im_fg,strcat('temp_fg_',int2str(k),'.bmp'));
    
    im_bg_1 = imdilate(im_temp_splited,SE2);
    im_bg_2 = imerode(im_bg_1,SE1);
    im_bg = im_bg_1-im_bg_2;
    imwrite(im_bg,strcat('temp_bg_',int2str(k),'.bmp'));
end

% detection
count=1;
for i=1:im_num
    % Read splited image
    im_splited = im2double(imread(sprintf('license2_%d.bmp',i)));
    for j=1:temp_num
        fg = im2double(imread(sprintf('temp_fg_%d.bmp',j)));
        bg = im2double(imread(sprintf('temp_bg_%d.bmp',j)));
        % Hit-miss
        result = bwhitmiss(im_splited,fg,bg);
        [row,col] = size(im_splited);
        % Find match
        if(result(floor(row/2),floor(col/2))==1)
            detect(count)=j;
            count=count+1;
        end
    end
end

str = character(detect);
end

