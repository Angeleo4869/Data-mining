% ���ʵ�����ر�Ҷ˹��������ѵ�����������ݼ��漰�������ԣ�Ҳ�漰�������ԡ�
% ���Դ������£�
% refund=[1 2 2 1 2 2 1 2 2 2]';
% mar=[1 2 1 2 3 2 3 1 2 1]';
% inc=[125,100,70,120,95,60,220,85,75,90]';
% trAttr =[refund,mar,inc];
% trLabels=[1 1 1 1 2 1 1 2 1 2]';
% tstAttr=[2,2,120];
% [type,Params,prior,AllLabels] = NaiveBayesTrain2(trAttr, trLabels);

function [type,Params,prior,AllLabels] = NaiveBayesTrain2(trAttr,trLabels)
AllLabels = unique(trLabels);
numClass = length(AllLabels);%ȡ���������ŵ��������
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
    numAttrValsClass = length(unique(AttrVals)); % ȡ���������Ա�ŵ��������
    maxAttrVals = max(unique(AttrVals)); % ȡ�õ�ǰ��������Ա��
    if ( isempty(find(rem(AttrVals,1)~=0) )&& numAttrValsClass< 10 && maxAttrVals ==numAttrValsClass )
        %%%% ������Ϊ��������k��ȡֵ�����Ҫ��ȡֵΪ1��2��������k
        %%%%����Ϊ�������ԣ�type=0
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
