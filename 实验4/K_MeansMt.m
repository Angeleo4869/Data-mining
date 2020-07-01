% ��������
% load 'data.mat';
% [u re]=K_MeansMt(data,3);  %�������ر�� re 
% [m n]=size(re);
% %�����ʾ����������
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

% k��ʾ ���ݷֶ�����
% data������Ĳ��������ŵ�����
% u ��ÿһ�������
% clusterID �Ƿ��صĴ������ŵ�����
function [u clusterID]=K_MeansMt(data,k)
% m�����ݸ��� ��n ������ά��
 [m,n] = size(data);
 ma = zeros(1,n); %ÿһά������
 mi = zeros(1,n); %ÿһά��С����
 u = zeros(k,n); %�����ʼ�������յ�����ÿһ�������λ��
 
 for i=1 : n
     ma(i) = max(data(:,i)); %ÿһά������
     mi(i) = min(data(:,i)); %ÿһά��С����
     for j=1 : k
% �����ʼ��
         u(j,i) = mi(i) + (ma(i)-mi(i))*rand();
     end
 end
 
 while 1
     pre_u = u;  %��һ����õ�����λ��
     coordinate_difference{m,k} = [];
     for i=1 : m
         %data(i,:)-u(j,:) Ϊ����������׼��
         for j=1 : k
             coordinate_difference{i,j} = data(i,:)-u(j,:);
         end
     end
     Dist = ones(m,k)*-1;
     for i=1 : m  % ��������
         c = zeros(1,k);
         for j=1 : k
             c(j) = norm(coordinate_difference{i,j});
         end
         [cmin index] = min(c);  % ���������С�� index
         Dist(i,index) = norm(coordinate_difference{i,index});
     end
     for i=1 : k
         ind = find(Dist(:,i)>=0);
         u(i,:) = mean(data(ind,:));
     end
     
     if norm(pre_u-u)<0.1 % ���ϵ���ֱ��λ�ò��ٱ仯
         break;
     end
 end
 
 
 clusterID = [];
 for i=1 : m
     dist = [];
     for j=1:k
         dist = [dist norm(data(i,:)-u(j,:))]; % ÿ���㵽�ȶ���������ĵľ���
     end
     [x index] = min(dist); % ѡ�������С������
     clusterID=[clusterID; index];
 end
end
