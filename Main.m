


%%%%%%%%%%%%%%%%%%% @copy by sobhna siamak %%%%%%%%%%%%%%%%%%

clc;
clear;
close all;
warning('off')

%% Supervised PCA and Kernel Supervised PCA

%%%%%%%First set datasets to Rows=Features and Columns=Samples
%% Two Moons dataset
tm=load('twomoons.mat');
Xtm=tm.x';
Ytm=tm.y';
% ep=0.006;
% di=6;
ep=0.006;
di=6;

%% Concentric Rectangles
cr=load('Concentric_rectangles.mat');
Xcr=cr.Data.X;
Ycr=cr.Data.Y;

%% Concentric Circles
cring=load('Concentric_rings.mat');
Xcring=cring.X';
Ycring=cring.Y';


%% Binary XOR

% bxor=load('Binary_XOR.mat');
% Xbxor=bxor.data.X;
% Ybxor=bxor.data.Y;


bxor=load('Binary_XOR.txt');
Xbxor=bxor(:,1:end-1)';
Ybxor=bxor(:,end)';

%% Haye roth
hr=load('Hayes-roth.txt');
Xhr=hr(:,1:end-1)';
Yhr=hr(:,end)';


% hr=load('Hayes-roth.txt');
% Xhr=hr(:,2:end)';
% Yhr=hr(:,1)';

%% SRBCT
% Srbct=load('SRBCT.mat');
% Xsrb=Srbct.data(:,2:end)';
% Ysrb=Srbct.data(:,1)';


Srbct=load('SRBCT.txt');
Xsrb=Srbct(:,1:end-1)';
Ysrb=Srbct(:,end)';

% Srbct=load('SRBCT.txt');
% Xsrb=Srbct(:,2:end)';
% Ysrb=Srbct(:,1)';


%% Normalize Data
Dataset=Xtm;%%%%%color=rbrb or brbr
Y=Ytm;
Name='TwoMoons';
c=2;%%%%C is the number of classes
% Dataset=Xcr;%%%%%color = rbbr
% Y=Ycr;
% Name='Concentric-rectangles';
% c=3;%%%%C is the number of classes
% Dataset=Xcring;%%%%%%color=rbbr
% Y=Ycring;
% Name='Concentric-circles';
% c=2;%%%%C is the number of classes
% Dataset=Xbxor;%%%%%Color=rbbr
% Y=Ybxor;
% Name='BinaryXOR';
% c=2;%%%%C is the number of classes
% Dataset=Xhr;
% Y=Yhr;
% Name='Haye-roth';
% c=3;%%%%C is the number of classes
% Dataset=Xsrb;
% Y=Ysrb;
% Name='SRBCT';
% c=4;%%%%C is the number of classes


NDataset=Normalize(Dataset);
% NDataset=Dataset;


%% split train and test

[xtrain,ytrain,xtest,ytest]=SplitTrainTest( NDataset,Y);

figure,
scplot( xtrain(1:2,:),ytrain,xtest(1:2,:),ytest,c)
% scatter(xtrain(1,:),xtrain(2,:));
% hold on 
% scatter(xtest(1,:),xtest(2,:))


%% Simple KNN 
p=size(xtrain,1);
q=size(ytest,2);
k=1;
if(p>20)
    p=20;
end

%%%%% array for saving prediction from KNN 
result=zeros(p,q);
err=zeros(1,p);

    for iter=1:10
        for i=1:p
           xtrainp=xtrain(1:i,:);
           xtestp=xtest(1:i,:);
        %    predict=KNNCls(xtrainp,ytrain,xtestp,k);
           predict=knnclassify(xtestp',xtrainp',ytrain,1);
           result(i,:)=predict;
           if(i==2)
               xtestD=xtest;
               xtrainD=xtrain;

           end
        end
        for i=1:p
        %     a=predict-ytest;
            a=result(i,:)-ytest;
            err(1,i)=nnz(a)/numel(a);
            fprintf('Simple KNN Error in %s Dataset from Dimention %d is %f.\n',Name,i,err(1,i));
        end
    end


%        xtestD=xtestD-mean(mean(xtrainD));
%        figure,
%        scatter(xtrainD(1,:),xtrainD(2,:));
%        hold on
%        scatter(xtestD(1,:),xtestD (2,:));


% scatter(Xtm(:,1),Xtm(:,2));

% scatter();

%% Supervised PCA

p=size(xtrain,1);
q=size(ytest,2);
r=size(ytrain,2);
k=1;
if(p>20)
    p=20;
end
result1=zeros(p,q);
err1=zeros(1,p);
kernelD=zeros(r,r);
for i=1:r
    for j=1:r
        if(ytrain(1,i)==ytrain(1,j))
            kernelD(i,j)=1;
        end
    end
end
L=kernelD;
   for iter=1:10
        for i=1:p
           [ztrain,ztest] = SPCA(xtrain,xtest,ytrain,ytest,kernelD,i);
        %    ztrainp=ztrain(1:i,:);
        %    ztestp=ztest(i,:);
           predict1=KNNCls(ztrain,ytrain,ztest,k);
           error(i) = sum(predict1~=ytest)/size(ytest,2);
           %result1(i,:)=predict1; 
           error(i)=ETune(error(i));
           fprintf('SPCA+KNN Error in %s Dataset from Dimention %d is %f.\n',Name,i,error(1,i));
           if(i==2)
               ztestD=ztest;
               ztrainD=ztrain;

           end
        end
   end  %%%% end of iteration =10


figure,
scplot(ztrainD(1:2,:),ytrain, ztestD(1:2,:),ytest,c);


%        ztestD=ztestD-mean(mean(ztrainD));
%        figure,
%        scatter(ztrainD(1,:),ztrainD(2,:));
%        hold on
%        scatter(ztestD(1,:),ztestD(2,:));
% 
% 
% % for i=1:p
% % %     a=predict-ytest;
% %     b=result1(i,:)-ytest;
% %     err1(1,i)=nnz(b)/numel(b);
% %     fprintf('SPCA+KNN Error in %s Dataset from Dimention %d is %f.\n',Name,i,err1(1,i));
% % end



%% Kernel Superviced PCA

p=size(xtrain,1);
q=size(ytest,2);
r=size(ytrain,2);
k=1;
if(p>20)
    p=20;
end
result2=zeros(p,q);
err2=zeros(1,p);
L=kernelD;%%%%%%This Kernel is same the SPCA Kernel
for iter=1:10%%%%%%10 times run 
    for i=1:p    
    %%%%% Sigma Tune
   % [sigma]=STune(xtrain,ytrain,i);
   sigma=0.09;
    %%%%% end  of Sigma Tune    
    [ztrain1,ztest1] = KSPCA( xtrain,xtest,ytrain,ytest,L,i,sigma );%%%%Final KSPCA with Tune Sigma

    if(i==2)
        ztrain1D=ztrain1;
        ztest1D=ztest1;
    end
    predict2=knnclassify(ztest1',ztrain1',ytrain,1);
    error2(i) = (sum(predict2~=ytest')/size(ytest,2));
    %result2(i,:)=predict2; 
    error2(i)=ETune(error2(i));
    % predict2=KNNCls(ztrain1,ytrain,ztest1,k);

    fprintf('KSPCA+KNN Error in %s Dataset from Dimention %d is %f.\n',Name,i,error2(1,i));

    end
end  %%%% end of iteration=10

figure,
scplot(ztrain1D(1:2,:),ytrain, ztest1D(1:2,:),ytest,c);





%     ztest1D=ztest1D-mean(mean(ztrain1D));
%     figure,
%     scatter(ztrain1D(1,:),ztrain1D(2,:));
%     hold on
%     scatter(ztest1D(1,:),ztest1D(2,:));


% for i=1:p
% %     a=predict-ytest;
%     c=result2(i,:)-ytest;
%     err2(1,i)=nnz(c)/numel(c);
%     fprintf('KSPCA+KNN Error in %s Dataset from Dimention %d is %f.\n',Name,i,err2(1,i));
% end


