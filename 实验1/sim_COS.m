% ʵ���������������ͬά�ȵ�����֮��ļн��������ƶȼ���
% ���Դ������£�
% x=[3,20,3.5]; y=[-3,34,7];
% sim=sim_COS(x,y);

function sim = sim_COS(X,Y)
sim = dot(X,Y)/(norm(X)*norm(Y));
