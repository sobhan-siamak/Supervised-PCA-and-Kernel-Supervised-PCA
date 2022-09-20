function [ predict ] = KNNCls( xtrain,ytrain,xtest,k)
%% KNN that K=1
[m,n]=size(xtrain);
% p=size(xtest,2);
q=size(xtest,2);
predict=zeros(1,q);
arr=zeros(1,n);
for i=1:q
    for j=1:n
        arr(1,j)=norm(xtest(:,i)-xtrain(:,j));%%Euclidian Distance
    end
    [mn,indmn]=min(arr);
    predict(1,i)=ytrain(1,indmn);
    
end



end

