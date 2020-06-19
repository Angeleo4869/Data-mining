function Params1=GetParams4CategoricalAttr(AttrVals,ind)
Params1=[];
AllAttrVals =unique(AttrVals);
numAttrValsClass = length(AllAttrVals);
AttrVals4ThisClass=AttrVals(ind);
nj=length(ind);
for i=1:numAttrValsClass
    nij=length(find(AttrVals4ThisClass==AllAttrVals(i)));
    Params1(i)=nij/nj;
end
end
