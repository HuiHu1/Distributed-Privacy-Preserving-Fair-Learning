clear
clc;
tic
t1=toc;
DataSample = csvread('data/compas/compas.csv');
randomset = csvread('data/compas/compas_index.csv');
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
    normal_data = DataSample(:,1:14); 
    trainset = randomset(1:12000,loop);
    testset = randomset(12001:16000,loop);
    train_x = normal_data(trainset(:,1),:);
    train_label = DataSample(trainset(:,1),16);
    test_x = normal_data(testset(:,1),:);
    test_label = DataSample(testset(:,1),16);
    total=80000;
    u=0;
    sigma=1;
    R =normrnd(u,sigma,featureNum,total);
    W_fair=zeros(featureNum,total);
    covariance=0.1;
    for i=1:total
        W_fair(:,i)=NewThirdParty(train_x*R(:,i),R(:,i),covariance,loop,DataSample,randomset);
    end
    W_fair(:,all(W_fair==0)) = [];
    [a b]=size(W_fair);
    if(b~=0)
        dimension=b;
        W_new =W_fair;
        %alpha =10^(3); %optimal value by using k-fold crossvalidation
        for parameter=3 %(-5~5)
            alpha = 10^(parameter);
            cofficient = pinv(transpose(W_new)*transpose(train_x)*train_x*W_new+alpha*eye(dimension,dimension))*transpose(W_new)*transpose(train_x)*train_label;
            prediction_label = test_x*(W_new*cofficient);
            [prow pcolumn]=size(prediction_label);
            for i = 1:prow
                if(abs(prediction_label(i,1))>=0.5)
                    prediction_label(i,1)=1;
                else
                    prediction_label(i,1)=0;
                end
            end
            [trow,tcolumn]=size(test_x);
            count =0;
            for j=1:trow
                if(abs(prediction_label(j,1))~=test_label(j,1))
                    count =count+1;
                end
            end
            error_temp = count/trow;
            if(data1(loop,1) > error_temp)
                data1(loop,1) = error_temp;
            end
            error_temp=0;
            [sub_error_min,sub_error_ma,Fair_SP,Fair_DI] = Calcualte(prediction_label,test_label,loop,DataSample,randomset);
            data_minority(loop,1)=sub_error_min;
            data_majority(loop,1)=sub_error_ma;
            if(SP(loop,1)>Fair_SP)
              SP(loop,1)=Fair_SP;
            end
            if(SP(loop,1)==0)
                DI(loop,1)=0;
            else
                if(DI(loop,1)>Fair_DI)
                DI(loop,1)=Fair_DI;
                end
            end
        end
    end
end
# Select efficient iterations
[diviation_SP,diviation_DI,diviation_Error] = Deviation(SP,DI,data1);
t2=toc;
display(strcat('parfor²¢ÐÐ¼ÆËãÊ±¼ä£º',num2str(t2),'Ãë'));
