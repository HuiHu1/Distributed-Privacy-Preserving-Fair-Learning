%------------------------Crime------------------------------
training = DataSample(1:1493,2:100);
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
testing = DataSample(1494:1993,2:100);
[row,column]=size(testing);
temp2=0;
for i=1:row
    for j=1:column
        testing(i,j)=(testing(i,j)-average(j,1))/sigma(j,1); 
    end
end
%--------------------------------COMPAS-------------------------
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
%---------------------------------Credit--------------------------
training = DataSample(1:15000,1:22); 
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
testing = DataSample(15001:20000,1:22);
[row,column]=size(testing);
temp2=0;
for i=1:row
    for j=1:column
        testing(i,j)=(testing(i,j)-average(j,1))/sigma(j,1);
    end
end