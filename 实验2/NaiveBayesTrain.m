% 编程实现朴素贝叶斯分类器的训练。假设数据只涉及连续属性。
% 测试代码如下：
% load('trainingData.mat');
% load('testingData.mat');
% [Params,prior,AllLabels] = NaiveBayesTrain(trAttr, trLabels);

function [Params,prior,AllLabels] = NaiveBayesTrain(trAttr,trLabels)
AllLabels = unique(trLabels);
numClass = length(AllLabels);%取得所有类标号的种类个数
Ind4Class{numClass,1} = [];
for i =1 : numClass
   ind = find(trLabels == AllLabels(i));
   Ind4Class{i,1} = ind;
   prior(i) = length(ind)/length(trLabels);
end

numAttr = size(trAttr,2);
Params{numClass,numAttr} = [];

for AttrInd = 1 : numAttr
    AttrVals = trAttr(:,AttrInd);
    for i = 1 : numClass
        Params{i,AttrInd} = GetParams4ContiAttr(AttrVals,Ind4Class{i,1});
    end
end

end

function Paramsl = GetParams4ContiAttr(AttrVals,ind)
Attrvals4ThisClass = AttrVals(ind);
Paramsl(1) = mean(Attrvals4ThisClass);
Paramsl(2) = var(Attrvals4ThisClass);
end
