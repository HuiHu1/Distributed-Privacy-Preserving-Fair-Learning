function [W_fair] = NewThirdParty(non_sensitive,W_old,covariance,loop,DataSample,randomset)
trainset = randomset(1:12000,loop);
train_Sensitive=DataSample(trainset(:,1),15);
threshold=covariance; 
[a,b]=size(W_old);
s1 = train_Sensitive-mean(train_Sensitive)
len = 12000
cov_b = transpose(s1)*non_sensitive/len
if(abs(cov_b)<=threshold)
    W_fair = W_old;
else
    for i=1:a
       W_fair(i,1)=0; 
    end
end
