% 实现任意给定两个相同维度的向量之间的夹角余弦相似度计算
% 测试代码如下：
% x=[3,20,3.5]; y=[-3,34,7];
% sim=sim_COS(x,y);

function sim = sim_COS(X,Y)
sim = dot(X,Y)/(norm(X)*norm(Y));
