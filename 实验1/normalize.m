% ÊµÏÖ£ºº¯Êý[Samples2]=normalize(Samples)

function [Samples2]=normalize(Samples)
[M,N] = size(Samples);
Samples2 = zeros(M,N);
for i=1:N
    sam = Samples(:,i);
    STD = std(sam);    % ?¨®¡À¨º¡Á???
    MEAN = mean(sam);  % ?¨®?¨´??
    x = (sam-MEAN)/STD;
    Samples2(:,i)=x;
end
end
