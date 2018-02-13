%calculates year length based on sun mass and orbital altitude

function yearl = yearlength(M,R)

%initializes the gravitational constant
G = 6.67e-11;

%converts radius to meters
R = R*1000;

%solves for velocity
V = sqrt(((G*M)/R));

%finds the period in m/s
yearl = (2*pi*R)/V;
%converts it to days
yearl = yearl/3600;
yearl = yearl/24;
end