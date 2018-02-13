function [hMap,hMapN1,hMapN2, hMapN3] = generalSarSetup()
% function [hMap,hMapN1,hMapN2, hMapN3] = generalSarSetup()
%Returns the heatmap generated from the cross range compression of the
%target scene through the SAR simulation
clc; close all;

%--------------------------------------------------------------------------
%Scene Setup
%--------------------------------------------------------------------------
L = 400;%Width of Scene [X]
W = 400;%Length of Scene [Y]
scene = zeros(L,W);
A = 8;%Number of antennas
c = 3e8;%speed of propagation
tmax = (2*sqrt(L^2 + W^2))/c;%Assumes point diagonal across grid scene
timeVect = 0:(1/(c)):tmax;%time vector points spaced based off the time difference
antennas = round(linspace(16,W-16,A));%Ensures the antennas are spaced to not throw errors due to spacing
NT = length(timeVect);%Total Number of Time values in time vector
imageIdentificatonFlag = 0;

%--------------------------------------------------------------------------
% Target Generation
%--------------------------------------------------------------------------
%Ship 1
numRows = 5;
s = 100;
e1 = 250 - numRows;
e2 = 250 + numRows;
for j = 1: numRows
    scene(s, e1:e2) = 1;
    s = s + 1;
    e1 = e1 + 1;
    e2 = e2 - 1;
end
scene(s,((e1+e2)/2)) = 1;

%Beam 1
scene(310:325,250) = 1;

%Ship 2
numRows = 5;
s1 = 100;
e1_1 = 150 - numRows;
e2_1 = 150 + numRows;
for j = 1: numRows
    scene(s1, e1_1:e2_1) = 1;
    s1 = s1 + 1;
    e1_1 = e1_1 + 1;
    e2_1 = e2_1 - 1;
end
scene(s1,((e1_1+e2_1)/2)) = 1;

%Beam2
scene(310:325,150) = 1;
[rows, cols] = find(scene == 1);
targets = cat(2,rows,cols);
%Initial Scene Plotting
Lvect = round(linspace(0,L,length(scene)));
Wvect = round(linspace(0,W,length(scene)));
%Radiation Pattern %Radiation Pattern of cos(theta).*sin(theta)
theta = zeros(length(antennas),length(targets));
radPat = zeros(length(antennas),length(targets));

for j = 1: length(antennas)
    for k = 1: length(targets)
        theta(j,k) = atan2(targets(k,1),abs(antennas(j) - targets(k,2)));
        radPat(j,k) = cos(theta(j,k)).*sin(theta(j,k));
    end
end
figure()
subplot(1,2,1)
polar(theta,radPat,'--r');
hold on; %Due to nature of polar, first one must be plotted before hold on can be called
%Symmetric about the x-axis
polar(-theta,radPat, '--r');
title('Scene Radiation Pattern')
hold off
%Theoretical Model
thetaSpectrum = linspace(0,pi/2,1000);
radPatTheo = cos(thetaSpectrum).*sin(thetaSpectrum);
subplot(1,2,2)
polar(thetaSpectrum, radPatTheo,'--b');
hold on
polar(-thetaSpectrum, radPatTheo,'--b');
title('Theoretical Radiation Pattern')

%Initial Scene Plot
figure()
surf(Lvect', Wvect', scene)
shading interp
xlabel('LENGTH L (RANGE)');
ylabel('WIDTH W (CROSS RANGE)');
title('SAR Scene with Target');


%Received from Adam Gaynor as a recommendation for good correlation
%Transmit Signal for Cross Correlation | Modified Barker Code
txsig = [-1, -1, -1, 1, 1, -1, 1, -1, -1, -1, 1, 1, -1, 1, -1, -1];
%Transmit Signal and AutoCorrelation Plot
figure()
subplot(1,2,1);
plot(txsig,'r');
xlabel('Time'); ylabel('Amplitude');
title('Transmit Signal for SAR')
subplot(1,2,2);
plot(xcorr(txsig,txsig),'b');
xlabel('Time'); ylabel('Amplitude');
title('Autocorrelation Function')

%Pre Allocation for Range Compression
rangeProfiles = zeros(length(antennas), NT);
corr = zeros(length(antennas),NT);
sumCMatrix = zeros(length(antennas), NT);

%--------------------------------------------------------------------------
%Range Compression Algorithm
%--------------------------------------------------------------------------

for k = 1: length(antennas)%iterates through all antennas on specified target
    for j = 1 :length(targets)%Iterates through all the targets
        tarTime = (2*sqrt((targets(j,1)).^2 + (antennas(k) - targets(j,2)).^2))/c;%Round trip distance from target to antennas
        [~, xindx] = min(abs(timeVect - tarTime));%Determine index closest to time vector
        rangeProfiles(j,:) = [zeros(1,xindx-1), radPat(k,j).*txsig, zeros(1,NT-xindx-15)];%Insert transmit signal into raw time channel
        rawAWGN = rangeProfiles(j,:) + .5.*randn(1,length(rangeProfiles));%AWGN Noise
        rawSTRONG = rangeProfiles(j,:) + .8.*randn(1,length(rangeProfiles));%Strong Noise
        rawOW = rangeProfiles(j,:) + 2.*randn(1,length(rangeProfiles));%Overwhelming Noise
        tempComp = abs(xcorr(rangeProfiles(j,:), txsig));%Matched Filtering
        awgnCompTemp = abs(xcorr(rawAWGN, txsig));
        strongCompTemp = abs(xcorr(rawSTRONG, txsig));
        owCompTemp = abs(xcorr(rawOW, txsig));
        corr(j,:) = tempComp(NT:2*NT-1);%Eliminate extra signal length due to cross correlation
        corrCompAWGN(j,:) = awgnCompTemp(NT:2*NT-1);
        corrCompSTRONG(j,:) = strongCompTemp(NT:2*NT-1);
        corrCompOW(j,:) = owCompTemp(NT:2*NT-1);
    end
    sumCMatrix(k,:) = sum(corr,1);%Summation of each target per antenna
    awgnMatrix(k,:) = sum(corrCompAWGN,1);
    strongMatrix(k,:) = sum(corrCompSTRONG,1);
    owMatrix(k,:) = sum(corrCompOW,1);
end


%--------------------------------------------------------------------------
%Cross_Range Compression Algorithm
%--------------------------------------------------------------------------

%Create Grid
gSize = 500;%Grid Size
Lvect = round(linspace(0,L,gSize));
Wvect = round(linspace(0,W,gSize));
hMap = zeros(gSize,gSize);%Storage of heat map values
hMapN1 = zeros(gSize,gSize);%Storage of heat map values AWGN Noise
hMapN2 = zeros(gSize,gSize);%Storage of heat map values Strong Noise
hMapN3 = zeros(gSize,gSize);%Storage of heat map values Overwhelming Noise
%Cross Range Algorithm
for j = 1: gSize%Lvect iterator
    for i = 1: gSize %Wvect iterator
        t_test = (2*sqrt((Lvect(j)).^2 + (antennas - Wvect(i)).^2))/3e8;
        %Round time times from specific antenna to testpoint on grid
        %Partial Range Compression to find max index time
        for m = 1: length(antennas)
            [~, testInd] = min(abs(timeVect - t_test(m)));
            hMap(i,j) = hMap(i,j) +  sumCMatrix(m,testInd);
            hMapN1(i,j) = hMapN1(i,j) +  awgnMatrix(m,testInd);
            hMapN2(i,j) = hMapN2(i,j) +  strongMatrix(m,testInd);
            hMapN3(i,j) = hMapN3(i,j) +  owMatrix(m,testInd); 
        end
    end
end

%Meshgrid Plotting
[L,W] = meshgrid(Lvect,Wvect);
figure()
surf(W,L, hMap);
shading interp
xlabel('LENGTH L (RANGE)');
ylabel('WIDTH W (CROSS RANGE)');
title('SAR Backprojection Imaging Result');

figure()
surf(W,L, hMapN1);
shading interp
xlabel('LENGTH L (RANGE)');
ylabel('WIDTH W (CROSS RANGE)');
title('SAR Backprojection Imaging Result AWGN Noise');

figure()
surf(W,L, hMapN2);
shading interp
xlabel('LENGTH L (RANGE)');
ylabel('WIDTH W (CROSS RANGE)');
title('SAR Backprojection Imaging Result Strong Noise');

figure()
surf(W,L, hMapN3);
shading interp
xlabel('LENGTH L (RANGE)');
ylabel('WIDTH W (CROSS RANGE)');
title('SAR Backprojection Imaging Result Overwhelming Noise');

if imageIdentificatonFlag == 1;
    imageIdentification(hMapN1);
end

end

%--------------------------------------------------------------------------
%Sub Functions
%--------------------------------------------------------------------------

function [] = imageIdentification(scene)
% function [] = imageIdentification(scene)
[M,N] = size(scene);
randomNoise = randn(M,N);
emptyScene = zeros(M,N);
NEscene = emptyScene + randomNoise;%Noisy Empty Scene
Nscene = scene + randomNoise;%Noisy Actual Scene
correlationMatrix = randn(10,10);
%Empty Scene Correlation
sceneCorr1 = xcorr2(NEscene,correlationMatrix);
[L,W] = size(sceneCorr1);
figure()
Lvect = linspace(0,400,L);
Wvect = linspace(0,400,W);
[L1,W1] = meshgrid(Lvect,Wvect);
surf(W1,L1, sceneCorr1);
shading interp
xlabel('LENGTH L (RANGE)');
ylabel('WIDTH W (CROSS RANGE)');
title('Empty Scene Target Identification');

%Target Scene Correlation
sceneCorr2 = xcorr2(Nscene,correlationMatrix);
figure()
surf(W1,L1, sceneCorr2);
shading interp
xlabel('LENGTH L (RANGE)');
ylabel('WIDTH W (CROSS RANGE)');
title('Scene Target Identification');
end