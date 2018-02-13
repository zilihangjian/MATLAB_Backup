function [v] = bungee_tv(m,cd,t)
%BUNGEE_TV Calculate the velocity for a bungee cord, given the mass and the
%drag coefficent cd and time t. Mass is assumed to be in kilograms, 
%cd in kilgrams per meter, time in seconds
g = 9.8;%gravity 
v = sqrt(g*m/cd)*tanh(sqrt((g*cd)/m)*t);
area(v);
xlabel('Time');
ylabel('Velocity');
grid;
end

