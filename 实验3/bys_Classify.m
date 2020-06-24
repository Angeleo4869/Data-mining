function [post4all] = bys_Classify(trAttr,trLabels,tstAttr)
[Params,prior,AllLabels] = NaiveBayesTrain(trAttr, trLabels);
N = size(tstAttr,1);
Labels = zeros(N,1);
for i=1 : N
    tstAttrSample = tstAttr(i,:);
    post = NaiveBayesPrdeict(Params,prior,tstAttrSample);
    post4all(i,:) = post./sum(post);
end
end

