function [] = angleComparison(testTheta, testAzimuth, theta, azimuth)
% function [] = angleComparison(testTheta, testAzimuth, theta, azimuth)
%Visually compares two different vectors for both theta and azimuth angles
%to demonstrate similarity or differences between angles. Ideally, the
%function would be used to compare between a theoretical transmitter
%location's angles and the actual data
%Inputs: testTheta, vector containing the theoretical angles values
%          testAzimuth, vector containing the theoretical azimuth values
%          theta, vector containing the angle values
%          azimuth, vector containing the azimuth values
%  Outputs: NaN
%--------------------------------------------------------------------------
%Azimuth 
%--------------------------------------------------------------------------
%Graphics
figure();
set(gcf, 'Position',get(0,'Screensize'));subplot(1,2,1); 
title('Azimuth'); xlabel('Data Points'); ylabel('Degrees');
axis tight; hold on; 

%Variable Declaration
elements = length(azimuth);% number of elements to be plotted
for j = 1: elements
    %Plots the azimuth above the x axis in degrees
    while azimuth(j) < 0
        azimuth(j) = azimuth(j) + 360;
    end
    pause(.001);
    drawnow;
    plot([j j], [0 azimuth(j)],'b');
end

%Test Azimuth 

%Graphics
subplot(1,2,2); title('Test Azimuth'); 
xlabel('Data Points'); ylabel('Degrees');
hold on; axis tight;

for j = 1: elements
    %Plots testAzimuth above the x axis
    while testAzimuth(j) < 0
        testAzimuth(j) = testAzimuth(j) + 360;
    end
    pause(.001);
    drawnow;
    plot([j j], [0 testAzimuth(j)],'g');
end

%--------------------------------------------------------------------------
%Theta 
%--------------------------------------------------------------------------

%Graphics
figure(); subplot(1,2,1); title('Theta'); 
set(gcf, 'Position',get(0,'Screensize'));
xlabel('Data Points'); ylabel('Degrees');
hold on; axis tight;

for j = 1: elements
    %Plots theta above the x axis
    while theta(j) < 0
        theta(j) = theta(j) + 360;
    end
    pause(.001);
    drawnow;
    plot([j j], [0 theta(j)], 'r');
end

%Test Theta

%Graphics
subplot(1,2,2); title('Test Theta'); 
xlabel('Data Points'); ylabel('Degrees');
hold on; axis tight;

for j = 1: elements
    %Plots the testTheta above the x axis
    while testTheta(j) < 0
        testTheta(j) = testTheta(j) + 360;
    end
    pause(.001);
    drawnow;
    plot([j j], [0 testTheta(j)], 'k');
end

end