function [zeroReceive, oneReceive, originalTr, finalTr] = ...
    bitErrors(numRelays, errorRate)
% function [zeroReceive, oneReceive, originalTr, finalTr] = ...
%     bitErrors(numRelays, errorRate)
%Inputs: numRelays, integer value for the number of relays 
%        errorRate, value for the error rate of the transmission
%Outputs: zeroReceive, returns 1 if a zero was receieved 
%         oneReceive, returns a 1 if a one was receieved 
%         originalTr, value of the first transmission bit
%         finalTr, value of the final transmission bit
%Description: This function runs n number of relays at a specific error
%rate. During the first relay, the initial probabilities for transmitting a
%zero or one are accounted for. For the n-1 relays after the first, the
%output for the previous relay is used for the input for the next, so only
%the error rate will factor into the problem. Function is called for parts
%b and d in Project 1 Bit Errors

%Variable Declaration

transmissionVector = ones(1,numRelays);%Tracks how the bit changes through the transmissions
errorVector = rand(1,numRelays);%Used for the error rate
randBinaryDigit = rand();%Randomly picking a starting 0 or 1 based on P(X0) or P(X1)

if randBinaryDigit <= 0.40%Probability of transmitting a one
    originalTr = 1;%Original Starting point before checking error
    transmissionVector(1) = originalTr;
else%Probability of transmitting a zero
    originalTr = 0;
    transmissionVector(1) = originalTr;
end

%Binary Transmission Simulation
for j = 1: numRelays
    if errorVector(j) <= errorRate%%Error factor
        transmissionVector(j+1) = abs(1 - transmissionVector(j));
    else
        transmissionVector(j+1) = transmissionVector(j);
    end
end

%Checks final value at the end of n number of relays
if transmissionVector(numRelays) == 0
    zeroReceive = 1;
    oneReceive = 0;
    finalTr = 0;
else
    zeroReceive = 0;
    oneReceive = 1;
    finalTr = 1;
end
    
end