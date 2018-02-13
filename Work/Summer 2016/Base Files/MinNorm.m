function [] = MinNorm(signal)
% function [] = MinNorm(signal)
doas = [45,22.5,20]*pi/180;%Assuming we know the DOA's of the signals in radians
[sigWidth,sigLeng] = size(signal);%Number of data points collected for the signal
P = ones(1,sigWidth);
for j = 1: sigWidth
    P(j) = sum(abs(signal(j,:)).^2) / sigLeng;%Power of incoming signals
end
numArrays = 10; %Number of array elements
d = 0.5; %Distance between elements in wavelengths
% Steering vector matrix. Columns will contain the steering vectors of the r signals
steerV = exp(-1i*2*pi*d*linspace(0,numArrays-1,numArrays)'*sin(doas(:)'));%ArrayElementsxNumberSignals
X = (steerV*diag(sqrt(P)))*signal;%DataPointsxArrayElements 
R = X*X'/sigLeng; %Spatial covariance matrix ArrayElementsxArrayElements 

[Q ,D] = eig(R); %Compute eigendecomposition of covariance matrix
[~,I] = sort(diag(D),1,'descend'); %Find r largest eigenvalues
Q = Q (:,I); %Sort the eigenvectors to put signal eigenvectors first
Qs = Q (:,1:sigWidth); %Get the signal eigenvectors

% Define angles at which MinNorm “spectrum” will be computed
angles = (-90:0.1:90);
%Compute steering vectors corresponding values in angles
a1 = exp(-1i*2*pi*d*(0:numArrays-1)'*sin(angles(:).'*pi/180));
alpha = Qs(1,:);
Shat = Qs(2:numArrays,:);
ghat = -Shat*alpha'/(1-alpha*alpha');
g = [1;ghat];
minNorm_spectrum = ones(1,length(angles));
for k = 1:length(angles)
    minNorm_spectrum(k)=1/(abs(a1(:,k)'*g));
end
figure
plot(angles,abs(minNorm_spectrum))
xlabel('Angle in degrees')
title('Min-Norm')