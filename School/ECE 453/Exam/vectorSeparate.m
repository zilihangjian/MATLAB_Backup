clc; clear; close all;
N = 100;%Length of vector
lower = -5;%lower limit
upper = 5;%upper limit
vector = randi([lower,upper],N,1);
PE = 1;
PO = 1;
NE = 1;
NO = 1;
for j = 1: length(vector)
    if vector(j) >= 0
        if mod(vector(j),2) == 0
            vectorPE(PE) = vector(j);
            PE = PE + 1;
        else
            vectorPO(PO) = vector(j);
            PO = PO + 1;
        end
    elseif vector(j) < 0
        if mod(vector(j),2) == 0
            vectorNE(NE) = vector(j);
            NE = NE + 1;
        else
            vectorNO(NO) = vector(j);
            NO = NO + 1;
        end
    end
end