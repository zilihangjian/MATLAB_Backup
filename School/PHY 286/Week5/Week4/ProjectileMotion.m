function [x,y,Vx,Vy] = ProjectileMotion(theta,Vo,B,m,dt,g)%#ok<*AGROW> 
%function [x,y,Vx,Vy] = ProjectileMotion(theta,Vo,B,m,dt)
%
%
clc;
Vxi = Vo.*cosd(theta);%Initial Velocity in X direction
Vyi = Vo.*sind(theta);%Initial Velocity in Y direction
x(1) = 0;%Initial X position, vector of unknown length
y(1) = 0;%Initial Y position, vector of unknown length
Vx(1) = Vxi;%Initial X velocity, vector of unknown length 
Vy(1) = Vyi;%Initial Y velocity, vector of unknown length
i = 1;% counting statement for while loop
while y >= 0
    Vi = sqrt(Vx(i).^2 + Vy(i).^2);%Velocity over time
    Fdx = -B.*Vx(i).*Vi;%Drag Force in X direction
    Fdy = -B.*Vy(i).*Vi;%Drag Force in Y direction
%     if (y(i) + Vy(i)*dt) < 0
%         return;
%     end
    y(i+1) = y(i) + Vy(i)*dt;%Euler approx for position y
    x(i+1) = x(i) + Vx(i)*dt;%Euler approx for position x
    Vx(i+1) = Vx(i) - ((Fdx/m)*dt);%Euler approx for velocity x
    Vy(i+1) = Vy(i) - g - ((Fdy/m)*dt);%Euler approx for velocity y
    i = i + 1;%Update statement
end

end