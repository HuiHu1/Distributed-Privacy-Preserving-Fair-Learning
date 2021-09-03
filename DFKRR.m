clear
clc;
tic
t1=toc;
DataSample = csvread('data/compas/compas.csv');
randomset = csvread('data/compas/compas_index.csv');
training = DataSample(1:12000,1:14);
[r,c]=size(training);
average=zeros(c,1);
sigma=zeros(c,1);
temp=0;
for i=1:c
    average(i,1)=mean(training(:,i));
    for j=1:r
        temp = temp+(training(j,i)-average(i,1))^2;
        sigma(i,1)=sqrt(temp/r);
    end
end
for i=1:r
    for j=1:c
        training(i,j)=(training(i,j)-average(j,1))/sigma(j,1);
    end
end
testing = DataSample(12001:16000,1:14);
[row,column]=size(testing);
temp2=0;
for i=1:row
    for j=1:column
        testing(i,j)=(testing(i,j)-average(j,1))/sigma(j,1);
    end
end
%---------------------------------------------------------------------------
iter=50;
featureNum=14;
for i=1:iter
    data1(i,1)=Inf;
    SP(i,1)=Inf;
    DI(i,1)=Inf;
    data_minority(i,1)=Inf;
    data_majority(i,1)=Inf;
end
for loop=1:iter
    %normal_data = DataSample(:,1:14);
    normal_data = [training;testing];
    trainset = randomset(1:12000,loop);
    testset = randomset(12001:16000,loop);
    train_x = normal_data(trainset(:,1),:);
    train_label = DataSample(trainset(:,1),16);
    test_x = normal_data(testset(:,1),:);
    test_label = DataSample(testset(:,1),16);
    [x1,y1]=size(train_x);
    [x2,y2]=size(test_x);
    sigma1=1;
    Kernel=zeros(x1,x1);
    M=zeros(x2,x1);
    for i=1:x1
        for j=1:x1
            Kernel(i,j)=exp(-norm(train_x(i,:)-train_x(j,:))^2/(2*sigma1^2));
        end
    end
    for i=1:x2
        for j=1:x1
            M(i,j)=exp(-norm(test_x(i,:)-train_x(j,:),2)^2/(2*sigma1^2));
        end
    end
    total=10000;
    u=0;
    sigma2=1;
    R =normrnd(u,sigma2,x1,total);
    W_fair=zeros(x1,total);
    covariance=0.1;
    for i=1:total
        prediction = Kernel*R(:,i);
        for j=1:length(prediction)
            if(abs(prediction(j))<0.5)
                prediction(j)=0;
            else
                prediction(j)=1;
            end
        end
        W_fair(:,i)=NewThirdParty(prediction,R(:,i),covariance,loop,DataSample,randomset);
    end
    W_fair(:,all(W_fair==0)) = [];
    [row,column]=size(W_fair);
    W_new= W_fair;
    for parameter=3 #grid search
        lamda=10^(parameter);
        cofficient=pinv(transpose(W_new)*transpose(Kernel+lamda*eye)*(Kernel+lamda*eye)*W_new)*transpose(W_new)*transpose(Kernel+lamda*eye)*train_label;
        prediction_label = M*(W_new*cofficient);
        [prow,pcolumn]=size(prediction_label);
        for i = 1:prow
            if(abs(real(prediction_label(i,1)))>=0.5)
                prediction_label(i,1)=1;
            else
                prediction_label(i,1)=0;
            end
        end
        count =0;
        for j=1:prow
            if(prediction_label(j,1)~=test_label(j,1))
                count =count+1;
            end
        end
        error_temp=count/prow;
        [sub_error_min,sub_error_ma,Fair_SP,Fair_DI] = Calcualte(prediction_label,test_label,loop,DataSample,randomset);
        data_minority(loop,1)=sub_error_min;
        data_majority(loop,1)=sub_error_ma;
        data1(loop,1) = error_temp;
        error_temp=0;
        SP(loop,1)=Fair_SP;
        if(SP(loop,1)==0)
           DI(loop,1)=0;
        else
           DI(loop,1)=Fair_DI; 
        end
    end
end
%Select efficient iterations
[diviation_SP,diviation_DI,diviation_Error] = Deviation(SP,DI,data1);
t2=toc;
display(strcat('parfor²¢ÐÐ¼ÆËãÊ±¼ä£º',num2str(t2),'Ãë'));
