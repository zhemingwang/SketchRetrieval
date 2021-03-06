function [hog_feature] = feature_extraction_local( imgPath )
%EXTRACT_LOCAL_FEATURE 此处显示有关此函数的摘要
%函数功能：计算image或者sketch的local feature
%输入参数：image或者sketch
%输出参数：得到image或者sketctch的hog特征，一个image对应一个.mat文件
%
img = imgPath;
hog_feature = zeros((size(imgPath,1))*(size(imgPath,1)),36);
count = 1;

for i=1:size(img,1) % 循环处理图片上每一个像素点
    for j=1:size(img,1)
        if img(i,j) ~= 0  % 对于值为非0的像素点提取hog特征(非0的像素点，它的hog特征的值可能为空的矩阵，这是为什么？)
            [hog, ~, ~] = extractHOGFeatures(img, [i j]);
            len = size(hog);
            len = len(1);
            if (len ~= 0)   %计算得到的是一个非空矩阵,如果是空矩阵，则不需要进行更新操作，因为初始矩阵就是全0矩阵
                hog_feature(count,:) = hog;
            end
        end
        count = count + 1;
    end    
end

end