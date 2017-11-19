img = imread('lenna_downSampling.png');
samplingRatio = 2;

[original_width,original_height] = size(img);
width = original_width * samplingRatio;
height = original_height * samplingRatio;

img_upSampling = uint8(zeros(width,height));

for y = 1:height
    for x = 1:width
        sample_x = round(x/samplingRatio);
        sample_y = round(y/samplingRatio);
        img_upSampling(x,y) = img(sample_x,sample_y);
    end
end

imwrite(img_upSampling,'lenna_upSampling.png');
    
