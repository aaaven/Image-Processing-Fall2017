function str = detect_car_license_plate_v1(im,im_temp)

% Erode template
SE_temp = strel('square',3);
im_temp_eroded = imerode(im_temp,SE_temp);

% Split license
im_num = segmentation(im,'license_');
% Spilt the templates
temp_num = segmentation(im_temp_eroded,'temp_');

% Based on the segmentation random order design the dictonary
character=char('A','0','5','K','U','6','1','B','V','L','W','2','7',...
    'M','C','3','8','X','D','N','4','9','Y','O','E','Z','F','P','G',...
    'Q','H','R','S','I','J','T');

% Detection
count = 1;
for i = 1:im_num
    % Read splited image
    im_splited = im2double(imread(sprintf('license_%d.bmp',i)));
    for j = 1:temp_num
        % Read splited templates
        im_temp_splited = im2double(imread(sprintf('temp_%d.bmp',j)));
        % Erosion
        result = imerode(im_splited,im_temp_splited);
        % Find the matched character
        if(~isempty(find(result == 1, 1)))
            detect(count) = j;
            count = count+1;
        end
    end
end

str = character(detect);
end