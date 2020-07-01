% 测试数据
% load 'data.mat';
% [u re]=K_MeansMt(data,3);  %最后产生簇标号 re 
% [m n]=size(re);
% %最后显示聚类后的数据
% figure;
% hold on;
% for i=1:m 
%     if re(i)==1   
%          plot(data(i,1),data(i,2),'ro'); 
%     elseif re(i)==2
%          plot(data(i,1),data(i,2),'go'); 
%     else 
%          plot(data(i,1),data(i,2),'bo'); 
%     end
% end
% grid on;

% k表示 数据分多少类
% data是输入的布袋分类标号的数据
% u 是每一类的中心
% clusterID 是返回的带分类标号的数据
function [u clusterID]=K_MeansMt(data,k)
% m是数据个数 ，n 是数据维数
 [m,n] = size(data);
 ma = zeros(1,n); %每一维最大的数
 mi = zeros(1,n); %每一维最小的数
 u = zeros(k,n); %随机初始化，最终迭代到每一类的中心位置
 
 for i=1 : n
     ma(i) = max(data(:,i)); %每一维最大的数
     mi(i) = min(data(:,i)); %每一维最小的数
     for j=1 : k
% 随机初始化
         u(j,i) = mi(i) + (ma(i)-mi(i))*rand();
     end
 end
 
 while 1
     pre_u = u;  %上一次求得的质心位置
     coordinate_difference{m,k} = [];
     for i=1 : m
         %data(i,:)-u(j,:) 为计算质心作准备
         for j=1 : k
             coordinate_difference{i,j} = data(i,:)-u(j,:);
         end
     end
     Dist = ones(m,k)*-1;
     for i=1 : m  % 计算质心
         c = zeros(1,k);
         for j=1 : k
             c(j) = norm(coordinate_difference{i,j});
         end
         [cmin index] = min(c);  % 计算距离最小类 index
         Dist(i,index) = norm(coordinate_difference{i,index});
     end
     for i=1 : k
         ind = find(Dist(:,i)>=0);
         u(i,:) = mean(data(ind,:));
     end
     
     if norm(pre_u-u)<0.1 % 不断迭代直到位置不再变化
         break;
     end
 end
 
 
 clusterID = [];
 for i=1 : m
     dist = [];
     for j=1:k
         dist = [dist norm(data(i,:)-u(j,:))]; % 每个点到稳定后的类中心的距离
     end
     [x index] = min(dist); % 选择距离最小的类别号
     clusterID=[clusterID; index];
 end
end
