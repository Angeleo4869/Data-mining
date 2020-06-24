% ���ʵ��ROC���߻��Ƶĺ���roc_plot�����У��������ʹ���Լ���д�����ر�Ҷ˹����bys_post1�õ���
% ���Դ������£�
% load('testingData.mat')
% load('trainingData.mat')
% [post4all]=bys_Classify(trAttr, trLabels,tstAttr);
% y2=post4all(:,2);
% [auc2 ,FPR2 ,TPR2 ]  = roc_plot2(y2,tstLabels);

function  [AUC ,FPR ,TPR ]  = roc_plot2(deci,tstLabels)
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
xlabel('�鱨����');  
ylabel('���и���'); 
title(['ROC���Ϊ(AUC = ' num2str(AUC)  ')']);
end

