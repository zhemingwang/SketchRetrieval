function [A1,A2,A3,A4] = image_divide( image,cell_percent,image_percent)

%%IMAGE_DIVIDE 此处显示有关此函数的摘要
%   此处显示详细说明
%   这个函数用于图像分割，把输入的图像分为若干个cell
%   C = mat2cell(image,[size(image,1)/2 size(image,1)/2],[size(image,1)/2 size(image,1)/2]);
%   分割后的C，C的取值方法是C{1,1}，C{1,2}，C{2,1}，C{2,2}
%   256*256,128*128,64*64,32*32,16*16,8*8
%   length(find(A>0));计算矩阵A中非零元素的个数
%
%   输入参数：
%       image:图像矩阵
%       image_percent:     cell中非零元素占上一层cell中非零元素的比例
%       cell_percent:      cell中非零元素占当前层cell元素总数的比例
%
%   cell_percent和image_percent决定是否继续对cell进行分割
%
%
%
%   输出：分割情况。需要考虑的问题，如何根据分割情况把image提取特征后的矩阵进行划分，即按照何种形式组织整幅图像的特征。
%
%
%
%%
image_condition = cell_percent;
cell_condition = image_percent;

%% 矩阵E中第一行是image_percent,第二行是cell_percent
[E1,E2,E3,E4,E5,F1,F2,F3,F4,F5] = calculate_interest_points_distribution(image); 

%%
D1=[];  %   记录分割情况，元素值为1表示分割，元素值为0表示不分割
for i=1:size(E1,2)
    
    [result] = calculate_condition(E1(i),F1(i)); %给定一组image_percent,cell_percent判断它是否需要分割
    D1(i) = result;
end
A1 = reshape(D1,[2 2])';

%%
D2=[];  %   记录分割情况，元素值为1表示分割，元素值为0表示不分割
for i=1:size(E2,2)
    
    [result] = calculate_condition(E2(i),F2(i)); %给定一组image_percent,cell_percent判断它是否需要分割
    D2(i) = result;
end
A2 = reshape(D2,[4 4])';

%%
D3=[];  %   记录分割情况，元素值为1表示分割，元素值为0表示不分割
for i=1:size(E3,2)
    
    [result] = calculate_condition(E3(i),F3(i)); %给定一组image_percent,cell_percent判断它是否需要分割
    D3(i) = result;
end
A3 = reshape(D3,[8 8])';

%%
D4=[];  %   记录分割情况，元素值为1表示分割，元素值为0表示不分割
for i=1:size(E4,2)
    
    [result] = calculate_condition(E4(i),F4(i)); %给定一组image_percent,cell_percent判断它是否需要分割
    D4(i) = result;
end
A4 = reshape(D4,[16 16])';

%%
D5=[];  %   记录分割情况，元素值为1表示分割，元素值为0表示不分割
for i=1:size(E5,2)
    
    [result] = calculate_condition(E5(i),F5(i)); %给定一组image_percent,cell_percent判断它是否需要分割
    D5(i) = result;
end

% A1 = reshape(D1,[2 2])';
% A2 = reshape(D2,[4 4])';
% A3 = reshape(D3,[8 8])';
% A4 = reshape(D4,[16 16])';


%% divid_condition：构造一个分割条件，若cell满足这个条件就进行分割，若不满足这个条件就不分割。
    function [result] = calculate_condition(image_percent,cell_percent)
        result = 0;
        if ((image_percent>image_condition) || (cell_percent>cell_condition)) %这个公式以后作为判断是否分割的依据
            result =1;
        end     
    end


%%
end %   end of function
