
clc;
clear
close all;
%% ���·��
addpath(genpath('funs'))
%% ��������
load('64cluster_N10.mat');
data = zscore(data);%���й�һ��
X = data';
k = numel(unique(truth));
[m,n]=size(X);
maxIter = 100;
% ��ʼ��Y
 Y = ones(n,k);
 s = sum(Y,2);
 Y = Y./s;
%��ʼ��Theta:B
B = eye(m)/m;
%��ʼ��M
%    M = initialM(X,k); % method 1
  M = initialM_1(X,k); % method 2
gama = 0.003; %����

[outY,outM,outB,outObj,outNumIter] = AWFKM_v4(X,Y',B*M,B,gama,maxIter);
lac = findlabel(outY);

result = ClusteringMeasure(truth, lac)
toc
b=diag(B);
figure
X1 =X';
cm = colormap(jet(k));
% cm(2,3)=0;cm(3,2)=0;
for i=1:k
    plot(X1(lac==i,1),X1(lac==i,2),'.','Color',cm(i,:),'markersize',10); hold on;
end
diag(outB);
