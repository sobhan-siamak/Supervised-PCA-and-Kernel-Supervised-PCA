function [  ] = scplot( xtrain,ytrain,xtest,ytest,c)


m=size(ytrain,2);
n=size(ytest,2);

%%
% mu=mean(mean(xtrain));
% xtest=xtest-mu;

%% Two Class
if(c==2)
    cnt1=0;
    cnt2=0;
    a=unique(ytrain);
    for i=1:m
        if(ytrain(1,i)==a(1))
            cnt1=cnt1+1;
        else
            cnt2=cnt2+1;
        end       
        
    end
    count1=0;
    count2=0;
    b=unique(ytest);
    for j=1:n
        if(ytest(1,j)==b(1))
            count1=count1+1;
        else
            count2=count2+1;
        end
    end
    
    %% after counting class save
    sc1=zeros(2,cnt1);
    sc2=zeros(2,cnt2);
    a=unique(ytrain);
    for i=1:m
        if(ytrain(1,i)==a(1))
            sc1(:,i)=xtrain(:,i);
        else
            sc2(:,i)=xtrain(:,i);
        end
    end
    
    sct1=zeros(2,count1);
    sct2=zeros(2,count2);
    b=unique(ytest);
    for j=1:n
        if(ytest(1,j)==b(1))
            sct1(:,j)=xtest(:,j);
        else
            sct2(:,j)=xtest(:,j);            
        end
    end
    
    
    %% Finally Scatter 
    scatter(sc1(1,:),sc1(2,:),'b','filled');
    hold on
    scatter(sc2(1,:),sc2(2,:),'r','filled');
    hold on 
    scatter(sct1(1,:),sct1(2,:),'b','filled');
    hold on
    scatter(sct2(1,:),sct2(2,:),'r','filled');
%     title('Binary XOR Dataset');
    
end
%% Three Class
if(c==3)
    cnt1=0;
    cnt2=0;
    cnt3=0;
    a=unique(ytrain);
    for i=1:m
        if(ytrain(1,i)==a(1))
            cnt1=cnt1+1;
        end
        if(ytrain(1,i)==a(2))
            cnt2=cnt2+1;
        end
        if(ytrain(1,i)==a(3))
            cnt3=cnt3+1;
        end
    end
    %%%%%test
    count1=0;
    count2=0;
    count3=0;
    b=unique(ytest);
    k=size(b,2);
    for j=1:n
        if(ytest(1,j)==b(1))
            count1=count1+1;
        end
        if(ytest(1,j)==b(2))
            count2=count2+1;
        end
        if(k>2 && ytest(1,j)==b(3))
           count3=count3+1; 
        end
    end
    
    
    
        %% after counting class save

    sc1=zeros(2,cnt1);
    sc2=zeros(2,cnt2);
    sc3=zeros(2,cnt3);
    a=unique(ytrain);
    for i=1:m
        if(ytrain(1,i)==a(1))
            sc1(:,i)=xtrain(:,i);
        end
        if(ytrain(1,i)==a(2))
            sc2(:,i)=xtrain(:,i);
        end
        if(ytrain(1,i)==a(3))
            sc3(:,i)=xtrain(:,i);
        end
    end
    
    
    sct1=zeros(2,count1);
    sct2=zeros(2,count2);
    sct3=zeros(2,count3);

    b=unique(ytest);
    k=size(b,2);
    for j=1:n
        if(ytest(1,j)==b(1))
            sct1(:,j)=xtest(:,j);
        end
        if(ytest(1,j)==b(2))
            sct2(:,j)=xtest(:,j);            
        end
        if(k>2 && ytest(1,j)==b(3))
            sct3(:,j)=xtest(:,j);
        end
    end
    
    
    %% Finally Scatter 
    scatter(sc1(1,:),sc1(2,:),'b','filled');
    hold on
    scatter(sc2(1,:),sc2(2,:),'r','filled');
    hold on 
    scatter(sc3(1,:),sc3(2,:),'g','filled');
    hold on
    scatter(sct1(1,:),sct1(2,:),'b','filled');
    hold on
    scatter(sct2(1,:),sct2(2,:),'r','filled');
    hold on
    scatter(sct3(1,:),sct3(2,:),'g','filled');
%     title('Hayes Roth Dataset');
        
end
%% Four Class
if(c==4)
    cnt1=0;
    cnt2=0;
    cnt3=0;
    cnt4=0;
    a=unique(ytrain);
    for i=1:m
        if(ytrain(1,i)==a(1))
            cnt1=cnt1+1;
        end
        if(ytrain(1,i)==a(2))
            cnt2=cnt2+1;
        end
        if(ytrain(1,i)==a(3))
            cnt3=cnt3+1;
        end
        if(ytrain(1,i)==a(4))
            cnt4=cnt4+1;
        end
    end
    
    %%%%%test
    count1=0;
    count2=0;
    count3=0;
    count4=0;
    b=unique(ytest);
    k=size(b,2);
    for j=1:n
        if(ytest(1,j)==b(1))
            count1=count1+1;
        end
        if(ytest(1,j)==b(2))
            count2=count2+1;
        end
        if(k>2 && ytest(1,j)==b(3))
           count3=count3+1; 
        end
        if(k>3 && ytest(1,j)==b(4))
           count4=count4+1; 
        end
    end
            %% after counting class save

            sc1=zeros(2,cnt1);
            sc2=zeros(2,cnt2);
            sc3=zeros(2,cnt3);
            sc4=zeros(2,cnt4);
            a=unique(ytrain);
            for i=1:m
                if(ytrain(1,i)==a(1))
                    sc1(:,i)=xtrain(:,i);
                end
                if(ytrain(1,i)==a(2))
                    sc2(:,i)=xtrain(:,i);
                end
                if(ytrain(1,i)==a(3))
                    sc3(:,i)=xtrain(:,i);
                end
                if(ytrain(1,i)==a(4))
                    sc4(:,i)=xtrain(:,i);
                end
            end


            sct1=zeros(2,count1);
            sct2=zeros(2,count2);
            sct3=zeros(2,count3);
            sct4=zeros(2,count4);

            b=unique(ytest);
            k=size(b,2);
            for j=1:n
                if(ytest(1,j)==b(1))
                    sct1(:,j)=xtest(:,j);
                end
                if(ytest(1,j)==b(2))
                    sct2(:,j)=xtest(:,j);            
                end
                if(k>2 && ytest(1,j)==b(3))
                    sct3(:,j)=xtest(:,j);
                end
                if(k>3 && ytest(1,j)==b(4))
                    sct4(:,j)=xtest(:,j);
                end
            end
            
%% Finally Scatter 
    scatter(sc1(1,:),sc1(2,:),'b','filled');
    hold on
    scatter(sc2(1,:),sc2(2,:),'r','filled');
    hold on 
    scatter(sc3(1,:),sc3(2,:),'g','filled');
    hold on
    scatter(sc4(1,:),sc4(2,:),'y','filled');
    hold on
    scatter(sct1(1,:),sct1(2,:),'b','filled');
    hold on
    scatter(sct2(1,:),sct2(2,:),'r','filled');
    hold on
    scatter(sct3(1,:),sct3(2,:),'g','filled');
    hold on
    scatter(sct4(1,:),sct4(2,:),'y','filled');
    title('SRBCT Dataset');

            
    
    
end




end

