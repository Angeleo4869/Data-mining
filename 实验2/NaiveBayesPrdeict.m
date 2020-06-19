function post = NaiveBayesPrdeict(type,Params,prior,tstAttr)
numClass = length(prior);
numAttr = length(tstAttr);
post = [];
for i = 1: numClass
    p_AttrCond = 1;
    for AttrInd = 1 : numAttr
        AttrVals = tstAttr(AttrInd);
        if(type(AttrInd) == 0)%����Ϊ�������� type = 0
            p = Params{i,AttrInd}(AttrVals);% ���Ա���� 1��2  ���Ա�ű���� 1 ��ʼ
            p_AttrCond=p_AttrCond*p;
        else         %����Ϊ�������� type = 1
            mean = Params{i,AttrInd}(1);
            sig = sqrt(Params{i,AttrInd}(2));
            p = (1/(sqrt(2*pi)*sig))*exp(-(AttrVals-mean)^2/(2*sig^2));
            p_AttrCond = p_AttrCond*p;
        end
    end
    post(i) = p_AttrCond*prior(i);
end
end