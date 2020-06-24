
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


