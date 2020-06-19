% 编程实现朴素贝叶斯分类器的训练和分类。
% 
% load('trainingData.mat');
% load('testingData.mat');
% refund=[1 2 2 1 2 2 1 2 2 2]';
% mar=[1 2 1 2 3 2 3 1 2 1]';
% inc=[125,100,70,120,95,60,220,85,75,90]';
% trAttr =[refund,mar,inc];
% trLabels=[1 1 1 1 2 1 1 2 1 2]';
% tstAttr=[2,2,120];
% [Labels] = bys_Classify(trAttr,trLabels,tstAttr);

function [Labels] = bys_Classify(trAttr,trLabels,tstAttr)
[type,Params,prior,AllLabels] = NaiveBayesTrain2(trAttr, trLabels);
N = size(tstAttr,1);
Labels = zeros(N,1);
for i=1 : N
    tstAttrSample = tstAttr(i,:);
    post = NaiveBayesPrdeict(type,Params,prior,tstAttrSample);
    [maxValue,index] = max (post);
    Labels(i) = AllLabels(index);
end
end



