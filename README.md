







# 数据挖掘实验

## 实验一：相似度、距离、最近邻分类器

### **1、实验目的**

（1）理解相似度、距离的度量方式。

（2）理解最近邻分类器的工作原理。

### 2、**实验内容**

#### （1）、实现任意给定两个相同维度的向量之间的欧氏距离计算函数

```matlab
function dist = dist_E(x,y)
```

#### （2）、实现任意给定两个相同维度的向量之间的夹角余弦相似度计算函数

```matlab
function sim = sim_COS(X,Y)
```

#### （3）、实现K最近邻算法

```matlab
function [class] = KNN_Classify_E(trainingSamples, trainingLabels, testingSample,k)
```

#### （4）、函数[Samples2]=normalize(Samples)

```matlab
function [Samples2]=normalize(Samples)
```



## 实验二：**朴素贝叶斯分类器**

### **1、实验目的**

（1）理解朴素贝叶斯分类器的工作原理。

（2）编程实现朴素贝叶斯分类器。

### **2、实验内容**

#### （1）、实现朴素贝叶斯分类器的训练。假设数据只涉及连续属性

```matlab
function [Params,prior,AllLabels] = NaiveBayesTrain(trAttr,trLabels)

function Paramsl = GetParams4ContiAttr(AttrVals,ind)
```

#### （2）、实现朴素贝叶斯分类器的训练。假设数据既涉及连续属性，也涉及分类属性

```matlab
function [type,Params,prior,AllLabels] = NaiveBayesTrain2(trAttr,trLabels)

function Params1=GetParams4CategoricalAttr(AttrVals,ind)
```

#### （3）、实现朴素贝叶斯分类器的训练和分类

```matlab
function [Labels] = bys_Classify(trAttr,trLabels,tstAttr)

function post = NaiveBayesPrdeict(type,Params,prior,tstAttr)
```

## 实验三 **分类器性能度量**

### 一、**实验目的**

（1）理解分类器性能度量的方法。

（2）编程ROC曲线绘制。

### **二、实验内容**

#### （1）、实现ROC曲线绘制的函数roc_plot。

分类概率使用matlab自带的朴素贝叶斯函数得到。

```matlab
function  [AUC ,FPR ,TPR ]  = roc_plot(deci,tstLabels)
```

#### （2）分类概率使用自己编写的朴素贝叶斯函数bys_Classify得到。

```matlab
function [post4all] = bys_Classify(trAttr,trLabels,tstAttr)
function [Params,prior,AllLabels] = NaiveBayesTrain(trAttr,trLabels)
function Paramsl = GetParams4ContiAttr(AttrVals,ind)
function post = NaiveBayesPrdeict(Params,prior,tstAttr)	
```

## 实验四 聚类算法

### 一、**实验目的**

（1）理解聚类算法的基本原理。

（2）掌握kmeans聚类算法的原理与实现。

### **二、实验内容**

数据见data.mat，编程实现K means算法代码

```matlab
测试代码如下：
load 'data.mat';
[u re]=K_MeansMt(data,3);  %最后产生簇标号 re 
[m n]=size(re);
%最后显示聚类后的数据
figure;
hold on;
for i=1:m 
    if re(i)==1   
         plot(data(i,1),data(i,2),'ro'); 
    elseif re(i)==2
         plot(data(i,1),data(i,2),'go'); 
    else 
         plot(data(i,1),data(i,2),'bo'); 
    end
end
grid on;
```

```matlab
function [u clusterID]=K_MeansMt(data,k)
```

