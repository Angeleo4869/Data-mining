% ROC曲线绘制的函数roc_plot。其中，分类概率使用matlab自带的朴素贝叶斯函数得到。
% 测试代码如下：
% load('testingData.mat')
% load('trainingData.mat')
% nb = NaiveBayes.fit(trAttr, trLabels);
% p=posterior (nb,tstAttr);
% y1=p(:,2);
% [auc1 ,FPR1 ,TPR1 ]  = roc_plot(y1,tstLabels);

function  [AUC ,FPR ,TPR ]  = roc_plot(deci,tstLabels)
[val,ind] = sort(deci);
roc_y = tstLabels(ind);
Num = length(roc_y);
FPR = zeros(Num,1);
TPR = zeros(Num,1);
for i = 1:Num
   
    TP = sum(roc_y(i:end)==1);
    FP = sum(roc_y(i:end)==0);
    P = sum(roc_y(:)==1);
    N = sum(roc_y(:)==0);
    TPR(i) = TP/P;
    FPR(i) = FP/N;
    
end
TPR = [TPR;0];
FPR = [FPR;0];
AUC = 0;

for i = 2 : Num+1;
   AUC = AUC + TPR(i)*(FPR(i-1)-FPR(i)); 
end
figure,plot(FPR,TPR);
xlabel('虚报概率');  
ylabel('击中概率'); 
title(['ROC面积为(AUC = ' num2str(AUC)  ')']);
end
