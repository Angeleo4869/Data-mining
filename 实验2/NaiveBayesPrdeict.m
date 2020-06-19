function post = NaiveBayesPrdeict(type,Params,prior,tstAttr)
numClass = length(prior);
numAttr = length(tstAttr);
post = [];
for i = 1: numClass
    p_AttrCond = 1;
    for AttrInd = 1 : numAttr
        AttrVals = tstAttr(AttrInd);
        if(type(AttrInd) == 0)%属性为分类属性 type = 0
            p = Params{i,AttrInd}(AttrVals);% 属性编号是 1，2  属性编号必须从 1 开始
            p_AttrCond=p_AttrCond*p;
        else         %属性为连续属性 type = 1
            mean = Params{i,AttrInd}(1);
            sig = sqrt(Params{i,AttrInd}(2));
            p = (1/(sqrt(2*pi)*sig))*exp(-(AttrVals-mean)^2/(2*sig^2));
            p_AttrCond = p_AttrCond*p;
        end
    end
    post(i) = p_AttrCond*prior(i);
end
end