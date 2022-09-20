function [ NDataset ] = Normalize(Dataset)

[m,n]=size(Dataset);
NDataset=zeros(m,n);
% Dataset=Dataset';

for i=1:m
    
         minr=min(Dataset(i,:));    
         maxr=max(Dataset(i,:));
         vect=Dataset(i,:)-minr;
         vect=vect/(maxr-minr);
         NDataset(i,:)=vect;         
                 
    
end





end

