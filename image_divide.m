function [A1,A2,A3,A4] = image_divide( image,cell_percent,image_percent)

%%IMAGE_DIVIDE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%   �����������ͼ��ָ�������ͼ���Ϊ���ɸ�cell
%   C = mat2cell(image,[size(image,1)/2 size(image,1)/2],[size(image,1)/2 size(image,1)/2]);
%   �ָ���C��C��ȡֵ������C{1,1}��C{1,2}��C{2,1}��C{2,2}
%   256*256,128*128,64*64,32*32,16*16,8*8
%   length(find(A>0));�������A�з���Ԫ�صĸ���
%
%   ���������
%       image:ͼ�����
%       image_percent:     cell�з���Ԫ��ռ��һ��cell�з���Ԫ�صı���
%       cell_percent:      cell�з���Ԫ��ռ��ǰ��cellԪ�������ı���
%
%   cell_percent��image_percent�����Ƿ������cell���зָ�
%
%
%
%   ������ָ��������Ҫ���ǵ����⣬��θ��ݷָ������image��ȡ������ľ�����л��֣������պ�����ʽ��֯����ͼ���������
%
%
%
%%
image_condition = cell_percent;
cell_condition = image_percent;

%% ����E�е�һ����image_percent,�ڶ�����cell_percent
[E1,E2,E3,E4,E5,F1,F2,F3,F4,F5] = calculate_interest_points_distribution(image); 

%%
D1=[];  %   ��¼�ָ������Ԫ��ֵΪ1��ʾ�ָԪ��ֵΪ0��ʾ���ָ�
for i=1:size(E1,2)
    
    [result] = calculate_condition(E1(i),F1(i)); %����һ��image_percent,cell_percent�ж����Ƿ���Ҫ�ָ�
    D1(i) = result;
end
A1 = reshape(D1,[2 2])';

%%
D2=[];  %   ��¼�ָ������Ԫ��ֵΪ1��ʾ�ָԪ��ֵΪ0��ʾ���ָ�
for i=1:size(E2,2)
    
    [result] = calculate_condition(E2(i),F2(i)); %����һ��image_percent,cell_percent�ж����Ƿ���Ҫ�ָ�
    D2(i) = result;
end
A2 = reshape(D2,[4 4])';

%%
D3=[];  %   ��¼�ָ������Ԫ��ֵΪ1��ʾ�ָԪ��ֵΪ0��ʾ���ָ�
for i=1:size(E3,2)
    
    [result] = calculate_condition(E3(i),F3(i)); %����һ��image_percent,cell_percent�ж����Ƿ���Ҫ�ָ�
    D3(i) = result;
end
A3 = reshape(D3,[8 8])';

%%
D4=[];  %   ��¼�ָ������Ԫ��ֵΪ1��ʾ�ָԪ��ֵΪ0��ʾ���ָ�
for i=1:size(E4,2)
    
    [result] = calculate_condition(E4(i),F4(i)); %����һ��image_percent,cell_percent�ж����Ƿ���Ҫ�ָ�
    D4(i) = result;
end
A4 = reshape(D4,[16 16])';

%%
D5=[];  %   ��¼�ָ������Ԫ��ֵΪ1��ʾ�ָԪ��ֵΪ0��ʾ���ָ�
for i=1:size(E5,2)
    
    [result] = calculate_condition(E5(i),F5(i)); %����һ��image_percent,cell_percent�ж����Ƿ���Ҫ�ָ�
    D5(i) = result;
end

% A1 = reshape(D1,[2 2])';
% A2 = reshape(D2,[4 4])';
% A3 = reshape(D3,[8 8])';
% A4 = reshape(D4,[16 16])';


%% divid_condition������һ���ָ���������cell������������ͽ��зָ����������������Ͳ��ָ
    function [result] = calculate_condition(image_percent,cell_percent)
        result = 0;
        if ((image_percent>image_condition) || (cell_percent>cell_condition)) %�����ʽ�Ժ���Ϊ�ж��Ƿ�ָ������
            result =1;
        end     
    end


%%
end %   end of function