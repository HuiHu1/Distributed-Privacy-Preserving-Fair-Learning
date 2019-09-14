function [diviation_SP,diviation_DI,diviation_Error] = Deviation(SP,DI,data1,iter)
Avg_SP=mean(SP);
Avg_DI=mean(DI);
Avg_Error=mean(data1);
total_SP=0;
total_DI=0;
total_Error=0;
for i=1:iter
    total_SP = total_SP+(SP(i)-Avg_SP)^2;
    total_DI = total_DI+(DI(i)-Avg_DI)^2;
    total_Error =total_Error+(data1(i)-Avg_Error)^2;
end
diviation_SP = sqrt((1/iter)*total_SP);
diviation_DI = sqrt((1/iter)*total_DI);
diviation_Error = sqrt((1/iter)*total_Error);
end

