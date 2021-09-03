function [W_fair] = NewThirdParty(non_sensitive,W_old,covariance,loop,DataSample,randomset)
trainset = randomset(1:12000,loop);
train_Sensitive=DataSample(trainset(:,1),15);
threshold=covariance; 
[a,b]=size(W_old);
temp = cov(non_sensitive,train_Sensitive);
cov_b = temp(1,2);
if(abs(cov_b)<=threshold)
    W_fair = W_old;
else
    for i=1:a
       W_fair(i,1)=0; 
    end
end
%s1 = train_Sensitive-mean(train_Sensitive)
%len = 12000
%cov_b = transpose(s1)*non_sensitive/len
