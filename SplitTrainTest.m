 function [ xtrain,ytrain,xtest,ytest ] = SplitTrainTest( NDataset,Y )


 
 [m,n]=size(NDataset);
 numb1=round(0.7*n);
 numb2=n-numb1;
 xtrain=zeros(m,numb1);
 ytrain=zeros(1,numb1);
 xtest=zeros(m,numb2);
 ytest=zeros(1,numb2);
 trainindex=randperm(round(0.7*n));
 flag=zeros(1,n);
 for i=1:numb1
     xtrain(:,i)=NDataset(:,trainindex(i));
     ytrain(1,i)=Y(trainindex(i));
     flag(trainindex(i))=1;
 end
 ind=1;
 for j=1:n
     if(flag(j)==0)
         xtest(:,ind)=NDataset(:,j);
         ytest(1,ind)=Y(j);
         ind=ind+1;
     end
 end
 
 
 %testindex
 
 




end

