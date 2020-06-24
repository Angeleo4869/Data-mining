
function post = NaiveBayesPrdeict(Params,prior,tstAttr)
numClass = length(prior);
numAttr = length(tstAttr);
post = [];
for i = 1: numClass
    p_AttrCond = 1;
    for AttrInd = 1 : numAttr
        AttrVals = tstAttr(AttrInd);
            mean = Params{i,AttrInd}(1);
            sig = sqrt(Params{i,AttrInd}(2));
            p = (1/(sqrt(2*pi)*sig))*exp(-(AttrVals-mean)^2/(2*sig^2));
            p_AttrCond = p_AttrCond*p;
    end
    post(i) = p_AttrCond*prior(i);
end
end