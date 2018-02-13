function [] = DOA()
% Simulation of MUSIC, ESPRIT, MVDR, Min-Norm and Classical DOA
% algorithms for a uniform linear array.
%#ok<*NBRAK>
%Variable Declaration
%For all algorithms and 1024 snapshots of data, the minimum separation of
%angles is around 5 degrees
clc; close all; 
doas = [-30 0 30]*pi/180;% DOA’s of signals in rad.
P = [1 1 1];% Power of incoming signals
N = 10;% Number of array elements
K = 1024;% Number of data snapshots
d = 0.5;% Distance between elements in wavelengths
noise_var = 1;% Variance of noise
r = length(doas);% Total number of signals
% Steering vector matrix. Columns will contain the steering vectors
% of the r signals

A = exp(-1i*2*pi*d*(0:N-1)'*sin([doas(:).'])); 

% Signal and noise generation
sig = round(rand(r,K))*2-1; % Generate random BPSK symbols for each of the r signals
noise = sqrt(noise_var/2)*(randn(N,K)+1i*randn(N,K)); %Uncorrelated noise
X = A*diag(sqrt(P))*sig+noise; %Generate data matrix
R = (X*X')/K; %Spatial covariance matrix
[Q,D] = eig(R);   %Compute eigendecomposition of covariance matrix
[~,I] = sort(diag(D),1,'descend'); %Find r largest eigenvalues
Q = Q(:,I); %Sort the eigenvectors to put signal eigenvectors first
Qs = Q(:,1:r); %Get the signal eigenvectors
Qn = Q(:,r+1:N); %Get the noise eigenvectors

%MUSIC algorithm
%Define angles at which MUSIC spectrum will be computed
angles=(-90:0.1:90);
%Compute steering vectors corresponding values in angles
a1 = exp(-1i*2*pi*d*(0:N-1)'*sin([angles(:).']*pi/180));
%a1 breakdown:
%exp(-1i*2*pi*d*(0:N-1)' - computes a horizontal matrix of length N
%sin([angles(:).']*pi/180)) - computes the values for sin at every angle in
%angles, then puts the angle in radians

%Compute MUSIC Spectrum
music_spectrum = ones(1, length(angles));%Pre Allocation
for k=1:length(angles)
  music_spectrum(k)=(a1(:,k)'*a1(:,k))/(a1(:,k)'*(Qn*Qn')*a1(:,k));
end

%Prints the angles and assoicated MUSIC spectrum to that angle
for k=1: length(angles)
    if abs(music_spectrum(k) > 500)
        fprintf('MUSIC %f : angle %f\n', abs(music_spectrum(k)), angles(k));
    end
end
figure(1); subplot(1,4,1);
plot(angles, abs(music_spectrum))
title('MUSIC Spectrum'); xlabel('Angle in degrees')

%ESPRIT Algorithm
% phi = linsolve(Qs(1:N-1,:),Qs(2:N,:));
% ESPRIT_doas = asin(-angle(eig(phi))/(2*pi*d))*180/pi;
%MVDR
IR = inv(R);  %Inverse of covariance matrix
mvdr = ones(1, length(angles));%Pre Allocation
for k=1:length(angles)
  mvdr(k)=1/(a1(:,k)'*IR*a1(:,k));
end
subplot(1,4,2); plot(angles,abs(mvdr));
xlabel('Angle in degrees'); title('MVDR')

%Min norm method
alpha = Qs(1,:);
Shat = Qs(2:N,:);
ghat = -Shat*alpha'/(1-alpha*alpha');

g = [1;ghat];
minnorm_spectrum = ones(1, length(angles));%Pre Allocation
for k=1:length(angles)
  minnorm_spectrum(k) = 1/(abs(a1(:,k)'*g));
end
subplot(1,4,3);
plot(angles,abs(minnorm_spectrum))
xlabel('Angle in degrees')
title('Min-Norm')
%Estimate DOA’s using the classical beamformer
classical = ones(1, length(angles));%Pre Allocation
for k=1:length(angles)
  classical(k)=(a1(:,k)'*R*a1(:,k));
end
subplot(1,4,4);
plot(angles,abs(classical))
xlabel('Angle in degrees')
title('Classical Beamformer')
end
