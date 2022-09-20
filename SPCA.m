function [ ztrain,ztest ] = SPCA( xtrain,xtest,ytrain,ytest,kernelD,p )

n=size(xtrain,2);
H=eye(n)-(1/n)*ones(n,n);
L=kernelD;
Q=xtrain*H*L*H*xtrain';
%[v,d]=eig(Q);%%%%v is eigen vectors and d is eigen values
[U,d]=eigendecOriginal(Q,p,'LM');
%U=real(v(1:p,:));
% U=v;
ztrain=U'*xtrain;
% test = xtest - repmat(mean(xtrain,2),[1,size(xtest,2)]);
% ztest=U'*test;
ztest=U'*xtest;

end

