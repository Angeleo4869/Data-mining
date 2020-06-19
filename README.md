# 数据挖掘实验

## 实验一：相似度、距离、最近邻分类器

### **1、实验目的**

（1）理解相似度、距离的度量方式。

（2）理解最近邻分类器的工作原理。

### 2、**实验内容**

（1）、实现任意给定两个相同维度的向量之间的欧氏距离计算函数

`function dist = dist_E(x,y)`

（2）、实现任意给定两个相同维度的向量之间的夹角余弦相似度计算函数

`function sim = sim_COS(X,Y)`

（3）、实现K最近邻算法

`function [class] = KNN_Classify_E(trainingSamples, trainingLabels, testingSample,k)`

（4）、函数[Samples2]=normalize(Samples)

`function [Samples2]=normalize(Samples)`

## 实验二：**朴素贝叶斯分类器**

### **1、实验目的**

（1）理解朴素贝叶斯分类器的工作原理。

（2）编程实现朴素贝叶斯分类器。

### **2、实验内容**

（1）、实现朴素贝叶斯分类器的训练。假设数据只涉及连续属性

`function [Params,prior,AllLabels] = NaiveBayesTrain(trAttr,trLabels)`

`function Paramsl = GetParams4ContiAttr(AttrVals,ind)`

（2）、实现朴素贝叶斯分类器的训练。假设数据既涉及连续属性，也涉及分类属性

`function [type,Params,prior,AllLabels] = NaiveBayesTrain2(trAttr,trLabels)`

`function Params1=GetParams4CategoricalAttr(AttrVals,ind)`

（3）、实现朴素贝叶斯分类器的训练和分类

`function [Labels] = bys_Classify(trAttr,trLabels,tstAttr)`

`function post = NaiveBayesPrdeict(type,Params,prior,tstAttr)`



