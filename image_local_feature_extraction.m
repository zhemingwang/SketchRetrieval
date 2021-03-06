%
%文件功能：计算所有图片的local feature
%输入参数： 经过边缘检测的图像
%输出参数： 图片的local feature，一个image对应一个.mat文件
%
images_list = textread('edge_full_list.txt', '%s'); % edge_full.list为经过边缘提取后的图像文件的列表
len = size(images_list);
len = len(1);
fprintf('len %d\n', len);
for n = 1:len  % 循环处理每一副图片
    imgPath = images_list{n};
    
    fprintf('%d processing %s\n', n, imgPath);
    image = load(imgPath,'a');
    
    [hog_feature] = feature_extraction_local(image.a); 
    
    [filethstr, name, ext] = fileparts(imgPath);
    str = strcat('image_feature/',name);
    filename = strcat(str,'_local');
    save(filename,'hog_feature');   %   保存local feature
end



