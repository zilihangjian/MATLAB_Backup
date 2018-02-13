function [] = simPercentage(simulations, error)
%function [] = simPercentage(simulations, error)
%Inputs: simulations, integer value for the number of simulations to run
%        error, floating value between 0 and 1 for the error rate
%Outputs: No formal outputs, plots two different graphs. One for the
%correctness vs number of relays, and the other for P(0) vs number of
%relays
%Description: This function deals with the solution to part d) for 
%Project 1 Bit Errors. It uses the bitErrors function to determine how the
%error rate impacts the likelihood of correctly transmitting a certain bit
%Example function call for part d: simPercentage(100000, .002563788)
rng('shuffle');
probabilities = ones(3,20);%Vector for storing the P(0) and the P(1) for all 
%20 relays. Row 
relayVector = linspace(1,20,20);%Vector for holding the relay values
summations = ones(2,simulations);%For each simulation, it sums the values 
%for receiving a zero or a one. Zero in first row, One in second row
numCorrect = 0;
for j = 1: 20
    for i = 1:simulations
        [zeroReceive, oneRecieve, oT, fT] = bitErrors(j,error);
        if oT == fT
            numCorrect = numCorrect + 1;
        end
        summations(1,i) = zeroReceive;
        summations(2,i) = oneRecieve;
    end
    probabilities(1,j) = sum(summations(1,:)) / simulations;
    probabilities(2,j) = sum(summations(2,:)) / simulations;
    probabilities(3,j) = numCorrect / simulations;
    numCorrect = 0;%Resets the value for the next simulation
end

%Plot for the number of relays vs probability of receiving a zero
figure();
plot(relayVector(:),probabilities(1,:), 'b');
title('Probability of Zero Receieved vs Number of Relays');
xlabel('Number of Relays');
ylabel('Probability of Zero Received');

%Plot for the correctness probability vs the number of relays
figure();
plot(relayVector(:),probabilities(3,:), 'b');
title('Correctness Probability vs Number of Relays');
xlabel('Number of Relays');
ylabel('Correctness Probability');

end