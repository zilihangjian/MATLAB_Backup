function [] =  STD_Ellipse(estimates, transmitterLocation)
% function [] =  STD_Ellipse(estimates, transmitterLocation)

%Graphics
title('Confidence Ellipse');
axis tight; hold on; zoom on;
xlabel('Longitude'); ylabel('Latitude');
for i = 1: length(estimates)
    p1 = plot(estimates(i,1), estimates(i,2),'.b');
end
p2 = plot(transmitterLocation(1), transmitterLocation(2), 'vg');

STD = [1 2 3];%Standard deviation values for the confidence ellipses
Mu = mean(estimates);%average value of the vector of estimates for the transmitter location
X0 = bsxfun(@minus, estimates, Mu);
for i = 1: length(STD)
    k = 2 * normcdf(STD(i)) - 1;%converts the STD to chi k value
    scale = chi2inv(k,2);%generates the value to scale the confidence ellipse based off the STD
    Cov = cov(X0) * scale;%Generates the covariance matrix
    [V,D] = eig(Cov);%Calculates eigenvalues and eigenvectors
    [D, order] = sort(diag(D), 'descend');
    D = diag(D);
    V = V(:,order);
    framePoints = linspace(0,2*pi, 100);
    cframe = [cos(framePoints); sin(framePoints)];
    W = V*sqrt(D);%Transforms the circle into the appropriate ellipse via the eigenvectors
    cframe = bsxfun(@plus, W*cframe, Mu');
    plot(cframe(1,:), cframe(2,:));
end
legend([p1, p2], 'Estimate', 'Transmitter Location',...
    'Location', 'northoutside','Orientation', 'horizontal');
end