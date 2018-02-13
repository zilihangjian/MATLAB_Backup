function [] = problem3(guess1, guess2, guess3, error, iterLimit)
%function [] = problem3(guess1, guess2, guess3,error, iterLimt)

%Variables / Function Declarations
syms t1 t3 v1;
%YBus Matrix
B_11 = 15; B_12 = -5; B_13 = -10;
B_21 = -5; B_22 = 15; B_23 = -10;
B_31 = -10; B_32 = -10; B_33 = 20;
v3 = 1.02;
P1 = -0.8913; Q1 = -0.1434; P3 = -0.8184;

%Unknowns V2 and T2
f1 = @(t1, t3, v1)(-P1 + v1*B_12*sin(t1) + v1*v3*B_13*sin(t1-t3));%P1
f2 = @(t1, t3, v1)(-P3 + v3*v1*B_31*sin(t3-t1) + v3*B_32*sin(t3));%P3
f3 = @(t1, t3, v1)(-Q1 - v1^2*B_11 - v1*B_12*cos(t1) - v1*v3*B_13*cos(t1-t3));%Q1

% jacob = jacobian([sym(f1),sym(f2)], [theta1, theta2]);
jacobFunc = @(t1,t3,v1)([...
    v1*B_12*cos(t1) + v1*v3*B_13*cos(t1-t3),...
    -v1*v3*B_13*cos(t1-t3),...
    B_12*sin(t1) + v3*B_13*sin(t1-t3);...
    -v3*v1*B_31*cos(t3-t1),...
    v3*v1*B_31*cos(t3-t1) + v3*B_32*cos(t3),...
    v3*B_31*sin(t3-t1);...
    v1*B_12*sin(t1) + v1*v3*B_13*sin(t1-t3),...
    -v1*v3*B_13*sin(t1-t3),...
    -2*v1*B_11 - B_12*cos(t1) - v3*B_13*cos(t1-t3)]);

newValues = @(t1,t3,v1)([t1;t3;v1] -inv(jacobFunc(t1,t3,v1))...
    *[f1(t1,t3,v1);f2(t1,t3,v1);f3(t1,t3,v1)]);

%Iterations
t1Init = guess1; %T1[0]
t3Init= guess2; %T3[0]
v1Init = guess3; %V1[0]

tempValues = newValues(t1Init,t3Init,v1Init);
t1New = tempValues(1);
t3New = tempValues(2);
v1New = tempValues(3);

j = 1;
while(abs(t1Init - t1New) > error) && (abs(v1Init - v1New) > error) &&...
      (abs(t3Init - t3New) > error)  && (j < iterLimit)
    tempValues = newValues(t1New, t3New, v1New);
    t1Init = t1New;
    t3Init = t3New;
    v1Init = v1New;
    t1New = tempValues(1);
    t3New = tempValues(2);
    v1New = tempValues(3);
    j = j + 1;
end

t1NewD = t1New * (180/pi);
t3NewD = t3New * (180/pi);
fprintf('T1: %f \nT3: %f\nV1: %f \nIterations: %f\n', t1NewD, t3NewD, v1New,j);
P2New = v1New*B_21*sin(-t1New) + v3*B_23*sin(-t3New);
Q2New = -v1New*B_21*cos(-t1New) - B_22 - v3*B_23*cos(-t3New);
Q3New = -v3*v1New*B_31*cos(t3New - t1New) - v3*B_32*cos(t3New) - v3^2*B_33;
fprintf('P2: %f \nQ2: %f\nQ3: %f\n', P2New,Q2New,Q3New);

end