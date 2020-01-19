function [diviation_SP,diviation_DI,diviation_Error] = Deviation(SP,DI,data1)
diviation_SP = std(SP);
diviation_DI = std(DI);
diviation_Error = std(data1);
end

