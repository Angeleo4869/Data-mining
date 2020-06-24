function Paramsl = GetParams4ContiAttr(AttrVals,ind)
Attrvals4ThisClass = AttrVals(ind);
Paramsl(1) = mean(Attrvals4ThisClass);
Paramsl(2) = var(Attrvals4ThisClass);
end

