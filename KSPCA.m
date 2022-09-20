function [ ztrain,ztest ] = KSPCA( xtrain,xtest,ytrain,ytest,L,p,sigma )

n=size(xtrain,2);
r=size(xtest,2);
q=size(ytest,2);
H=eye(n)-(1/n)*ones(n,n);
k=zeros(n,n);
for i=1:n
    for j=1:n
        k(i,j)=exp(-(norm(xtrain(:,i)-xtrain(:,j)))/2*sigma^2);
    end
end
ktest=zeros(n,r);
for i=1:n
    for j=1:r
        ktest(i,j)=exp(-(norm(xtrain(:,i)-xtest(:,j))^2)/2*sigma^2);
    end
end
Q=H*L*H*k;%%%% for eigendecoriginal
[v,d]=eigendecOriginal(Q,p,'LM');%%%% for eigendecoriginal
% Q=k*H*L*H*k;
% [v,d]=eig(Q,k);
% [v1,Index] = sort(diag(d),'descend');
% v = v(:,Index);
% v1=real(v1);
% v1=v1(Index(1:p));
% v=v1;
% v=real(v);
% beta=v(1:p,:);
% beta=v(:,1:p);

% ztrain=beta*k;%%%%
% ztest=beta*ktest;%%%%
beta=v;%%%% for eigendecoriginal
ztrain=beta'*k;%%%% for eigendecoriginal
ztest=beta'*ktest;%%%% for eigendecoriginal


% ztrain=ztrain(1:p,:);
% ztest=ztest(1:p,:);



end

