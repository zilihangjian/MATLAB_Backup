function [] = part2(sigma0, n, trials)
% function [] = part2(sigma0,n,trials)

%Variable Declaration
clc; close all
rng('shuffle');
simVector1 = normrnd(0,sigma0,n, trials);
simVector2 = normrnd(0,sigma0-.50,n, trials);
simVector3 = normrnd(0,sigma0-.25,n, trials);
simVector4 = normrnd(0,sigma0+.25,n, trials);
simVector5 = normrnd(0,sigma0+.50,n, trials);

powerVector1 = simVector1.^2;
powerVector2 = simVector2.^2;
powerVector3 = simVector3.^2;
powerVector4 = simVector4.^2;
powerVector5 = simVector5.^2;

if n == 1
    arthVector1 = powerVector1;
    geoVector1 = powerVector1;
    medianVector1 = powerVector1;
    
    arthVector2 = powerVector2;
    geoVector2 = powerVector2;
    medianVector2 = powerVector2;
    
    arthVector3 = powerVector3;
    geoVector3 = powerVector3;
    medianVector3 = powerVector3;
    
    arthVector4 = powerVector4;
    geoVector4 = powerVector4;
    medianVector4 = powerVector4;
    
    arthVector5 = powerVector5;
    geoVector5 = powerVector5;
    medianVector5 = powerVector5;
else
    arthVector1 = sum(powerVector1) ./ n;
    geoVector1 = geomean(powerVector1);
    medianVector1 = median(powerVector1);
    
    arthVector2 = sum(powerVector2) ./ n;
    geoVector2 = geomean(powerVector2);
    medianVector2 = median(powerVector2);
    
    arthVector3 = sum(powerVector3) ./ n;
    geoVector3 = geomean(powerVector3);
    medianVector3 = median(powerVector3);
    
    arthVector4 = sum(powerVector4) ./ n;
    geoVector4 = geomean(powerVector4);
    medianVector4 = median(powerVector4);
    
    arthVector5 = sum(powerVector5) ./ n;
    geoVector5 = geomean(powerVector5);
    medianVector5 = median(powerVector5);
    %Produces the same result as geomean, wasn't sure if considered too
    %high level, so commented out the original geometric mean code to show
    %that I understood the function enough to program it and left the
    %geomean function for speed
    %     for j = 1: trials
    %         geoVector1(j) = (prod(powerVector(:,j))).^(1/n);
    %     end
end

%Plotting
figure();
histogram(arthVector1, 'Normalization', 'pdf');
title(strcat('Arithmetic Estimator | n = ', num2str(n)));
xlabel('Distribution Values');
ylabel('Concentration');

figure();
histogram(geoVector1, 'Normalization', 'pdf');
title(strcat('Geometric Estimator | n = ', num2str(n)));
xlabel('Distribution Values');
ylabel('Concentration');

figure();
histogram(medianVector1, 'Normalization', 'pdf');
title(strcat('Median Estimator | n = ', num2str(n)));
xlabel('Distribution Values');
ylabel('Concentration');

figure();
hold on;
histogram(arthVector1, 'Normalization', 'pdf');
histogram(geoVector1, 'Normalization', 'pdf');
histogram(medianVector1, 'Normalization', 'pdf');
title('All Estimators Comparison');
xlabel('Distribution Values');
ylabel('Concentration');
legend('Arithmetic', 'Geometric', 'Median');

figure();
hold on;
histogram(arthVector1,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
histogram(arthVector2,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
histogram(arthVector3,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
histogram(arthVector4,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
histogram(arthVector5,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
meanArthVector = [mean(arthVector2),mean(arthVector3),mean(arthVector1),...
    mean(arthVector4),mean(arthVector5)];
sigmaString1 = strcat('sigma | ', num2str(sigma0-.50));
sigmaString2 = strcat('sigma | ', num2str(sigma0-.25));
sigmaString3 = strcat('sigma | ', num2str(sigma0));
sigmaString4 = strcat('sigma | ', num2str(sigma0+.25));
sigmaString5 = strcat('sigma | ', num2str(sigma0+.50));
legend(sigmaString3, sigmaString1, sigmaString2, sigmaString4,sigmaString5);
title('Sigma Comparison for Arithmatic Estimator');
xlabel('Distribution Values');
ylabel('Concentration');


figure();
hold on;
histogram(geoVector1,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
histogram(geoVector2,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
histogram(geoVector3,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
histogram(geoVector4,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
histogram(geoVector5,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
legend(sigmaString3, sigmaString1, sigmaString2, sigmaString4,sigmaString5);
meanGeoVector = [mean(geoVector2),mean(geoVector3),mean(geoVector1),...
    mean(geoVector4),mean(geoVector5)];
title('Sigma Comparison for Geometric Estimator');
xlabel('Distribution Values');
ylabel('Concentration');

figure();
hold on;
histogram(medianVector1,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
histogram(medianVector2,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
histogram(medianVector3,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
histogram(medianVector4,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
histogram(medianVector5,'Normalization', 'pdf', 'DisplayStyle', 'stairs')
meanMedianVector = [mean(medianVector2),mean(medianVector3),mean(medianVector1),...
    mean(medianVector4),mean(medianVector5)];
legend(sigmaString3, sigmaString1, sigmaString2, sigmaString4,sigmaString5);
title('Sigma Comparison for Median Estimator');
xlabel('Distribution Values');
ylabel('Concentration');
sigmaValues = [sigma0-.50,sigma0-.25,sigma0,sigma0+.25,sigma0+.50];

figure()
hold on
plot(sigmaValues, meanArthVector);
plot(sigmaValues, meanGeoVector);
plot(sigmaValues, meanMedianVector);
title('Sigma Distribution Comparison');
xlabel('Sigma Values')
ylabel('Mean Location on Histogram');

arthCorrelation = polyfit(sigmaValues, meanArthVector,1);
geoCorrelation = polyfit(sigmaValues, meanGeoVector,1);
medianCorrelation = polyfit(sigmaValues, meanMedianVector,1);
arthSlope = arthCorrelation(1);
geoSlope = geoCorrelation(1);
medianSlope = medianCorrelation(1);
arthString = strcat('Arthimetic Sigma Relationship | ', num2str(arthSlope));
geoString = strcat('Geometric Sigma Relationship | ', num2str(geoSlope));
medianString = strcat('Median Sigma Relationship | ', num2str(medianSlope));
legend(arthString, geoString, medianString);
end