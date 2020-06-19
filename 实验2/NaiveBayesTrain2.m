% 编程实现朴素贝叶斯分类器的训练。假设数据既涉及连续属性，也涉及分类属性。
% 测试代码如下：
% refund=[1 2 2 1 2 2 1 2 2 2]';
% mar=[1 2 1 2 3 2 3 1 2 1]';
% inc=[125,100,70,120,95,60,220,85,75,90]';
% trAttr =[refund,mar,inc];
% trLabels=[1 1 1 1 2 1 1 2 1 2]';
% tstAttr=[2,2,120];
% [type,Params,prior,AllLabels] = NaiveBayesTrain2(trAttr, trLabels);

function [type,Params,prior,AllLabels] = NaiveBayesTrain2(trAttr,trLabels)
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
    numAttrValsClass = length(unique(AttrVals)); % 取得所有属性标号的种类个数
    maxAttrVals = max(unique(AttrVals)); % 取得当前的最大属性标号
    if ( isempty(find(rem(AttrVals,1)~=0) )&& numAttrValsClass< 10 && maxAttrVals ==numAttrValsClass )
        %%%% 若属性为分类属性k种取值情况，要求取值为1，2，。。。k
        %%%%属性为分类属性，type=0
        type(AttrInd)=0;       
        for i=1:numClass
            Params{i,AttrInd}=GetParams4CategoricalAttr(AttrVals,Ind4Class{i,1});
        end
    else
        type(AttrInd)=1;
        for i=1:numClass
            Params{i,AttrInd}=GetParams4ContiAttr(AttrVals,Ind4Class{i,1});
        end
    end

end
end
