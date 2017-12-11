function [number] = segmentation(im,name)
% label
temp = bwconncomp(im); 
number = temp.NumObjects;

% show & save chractors
    for i= 1:number
    [r,c] = ind2sub(temp.ImageSize,temp.PixelIdxList{i});
    imwrite(im(min(r)-3:max(r)+3, min(c)- 3:max(c)+3),strcat(name,int2str(i),'.bmp'));
    end    
end

