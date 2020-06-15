% 实现K最近邻算法
% 测试代码如下：
% load('testingData.mat');
% load('trainingData.mat');
% %[trAttr]=normalize(trAttr);
% %[tstAttr]=normalize(tstAttr);
% k=3;
% predictlabel =zeros(length(tstLabels),1);
% for i=1:length(tstLabels)
%    predictlabel(i) =KNN_Classify_E(trAttr, trLabels ,tstAttr(i,:) ,k);   
% end
% accurate =sum(predictlabel==tstLabels)/length(tstLabels);
% disp(accurate);

function [class] = KNN_Classify_E(trainingSamples, trainingLabels, testingSample,k)
[M,N] = size(trainingSamples); 
Distance = zeros(M,1); 
for i=1:M
    training = trainingSamples(i,:);
    Distance(i) = dist_E(training,testingSample);
end

[val ind] = sort(Distance);
labs = trainingLabels(ind(1:k));
All_labs = unique(labs); 
LabNum = length(All_labs);
for i=1:LabNum
    Vote(i) = length(find(labs==All_labs(i)));
end
[val ind] = max(Vote);
class = All_labs(ind);
end
