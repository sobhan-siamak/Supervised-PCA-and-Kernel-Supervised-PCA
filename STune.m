function [ SigmaT ] = STune( xtrain,ytrain,p)
S=[0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
k=1;%%%%%KNN=1NN
[m,n]=size(xtrain);
trainx=zeros(m,n-round(n/10));%%%%%10-fold
trainy=zeros(1,n-round(n/10));%%%%%10-fold
testx=zeros(m,round(n/10));%%%%%10-fold
testy=zeros(1,round(n/10));%%%%%10-fold
tune=zeros(1,10);
ind=1;
% train=
fold=round(n/10);
    for sigma =0.1:0.1:1
        kfold=zeros(1,10);%%%%% every sigma has 10 values
        for k=1:10
            if(k==1)
                testx=xtrain(:,1:fold);
                testy=ytrain(1,1:fold);
                trainx=xtrain(:,fold+1:end);
                trainy=ytrain(1,fold+1:end);
            end
           if(k==10)
                  testx=xtrain(:,(k-1)*fold+1:end);
                  testy=xtrain(1,(k-1)*fold+1:end);
                  trainx=xtrain(:,1:(k-1)*fold);
                  trainy=xtrain(1,1:(k-1)*fold);
           end
           if(k~=1 && k~=10)
                testx=xtrain(:,(k-1)*fold+1:k*fold);
                testy=xtrain(1,(k-1)*fold+1:k*fold);
                trainx=[xtrain(:,1:fold) xtrain(:,k*fold+1:end)] ;
                trainy=[xtrain(1,1:fold) xtrain(1,k*fold+1:end)];
           end
            
           p=size(trainx,1);
           q=size(testy,2);
           r=size(trainy,2);
           
           
           %%%%%Kernel L
            kernelD=zeros(r,r);
            for i=1:r
                for j=1:r
                    if(trainy(1,i)==trainy(1,j))
                        kernelD(i,j)=1;
                    end
                end
            end
           %%%%%          
           L=kernelD;
           [trainz,testz] = KSPCA(trainx,testx,trainy,testy,L,p,sigma);
            predict=KNNCls(trainz,trainy,testz,k);
            a=predict-testy;
            kfold(1,i)=nnz(a)/numel(a);
       end
        tune(1,ind)=sum(kfold)/10;%%%%%Mean of 10 values
        ind=ind+1;   

    end

     [minimums,indexmin]=min(tune);
     SigmaT=S(indexmin);
%        SigmaT=min(tune);

end


