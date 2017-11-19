img = imread('lenna512.bmp');
samplingRatio = 1/2;

[original_width,original_height] = size(img);
width = original_width * samplingRatio;
height = original_height * samplingRatio;

img_downSampling = uint8(zeros(width,height));

for y = 1:height
    for x = 1:width
        sample_x = round(x/samplingRatio);
        sample_y = round(y/samplingRatio);
        img_downSampling(x,y) = img(sample_x,sample_y);
    end
end

imwrite(img_downSampling,'lenna_downSampling.png');
    
