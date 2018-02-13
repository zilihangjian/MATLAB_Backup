function [theta,omega] = NonLinearPendulumDriven(dForce,dFreq,omega0,theta0,deltat,tmax)
%Fd = 0:.5:1.2
%q = 1/2
%dt = .04
%w0 = 0
%thetea0 = .2
%omegaD = 2/3
%tmax = 100

%Gravity and Pendulum Length
g = 9.8; L = 9.8;

%Damping Constant
qDamp = .5;

thetaPrev = theta0;
omegaPrev = omega0;
time = [0:deltat:tmax];
theta = zeros(size(time));
omega = zeros(size(time));

theta(1) = theta0;
omega(1) = omega0;
count = 1;
for t = time
    omegaNew = omegaPrev - ((g/L).*sin(thetaPrev) + qDamp.*omegaPrev - ...
        dForce.*sin(dFreq.*t)).*deltat;
    thetaNew = thetaPrev + omegaNew.*deltat;
    if theta >= pi
        thetaNew = ThetaNew - 2.*pi;
    elseif thetaNew < -pi
        thetaNew = thetaNew + 2.*pi;
    end
    theta(count) = thetaNew;
    omega(count) = omegaNew;
    thetaPrev = thetaNew;
    omegaPrev = omegaNew;
    count = count + 1;
end

str = sprintf('Fd = %.3f, drive-w = %0.3f, qdamp = %.3f',dForce,dFreq,qDamp);
plot(time,theta);

end