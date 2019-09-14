function [W_fair] = NewThirdParty(non_sensitive,W_old,covariance,loop,DataSample,randomset)
trainset = randomset(1:12000,loop);
train_Sensitive=DataSample(trainset(:,1),15);
threshold=covariance; 
[a,b]=size(W_old);
cov_between=cov(train_Sensitive,non_sensitive);
if(abs(cov_between(1,2))<=threshold)
    W_fair = W_old;
else
    for i=1:a
       W_fair(i,1)=0; 
    end
end
