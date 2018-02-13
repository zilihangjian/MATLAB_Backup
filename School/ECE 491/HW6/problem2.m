function [] = problem2(guess1, guess2, error, iterLimit)
%function [] = problem1(guess1, f1, guess2, f2, guess3, f3)

%Variables / Function Declarations
syms v2 t2;
G_11 = 0.2494; G_12 = -0.2494; G_21 = G_12; G_22 = G_11;
B_11 = -4.98; B_12 = 4.98; B_21 = B_12; B_22 = B_11;
P2 = 0.1358; Q2 = 0.2291;

%Unknowns V2 and T2
f1 = @(t2, v2)(P2 + v2*(G_21*cos(t2) + B_21*sin(t2)) + G_22*v2^2);
f2 = @(t2, v2)(Q2 + v2*(-G_21*sin(t2) - B_21*cos(t2)) - B_22*v2^2);

% jacob = jacobian([sym(f1),sym(f2)], [theta1, theta2]);
jacobFunc = @(t2,v2)([...
    -v2*G_21*sin(t2) + v2*B_21*cos(t2),...
    G_21*cos(t2) + B_21*sin(t2) + 2*v2*G_22;...
    v2*G_21*sin(t2) - v2*B_21*cos(t2),...
    G_21*cos(t2) - B_21*sin(t2) - 2*v2*B_22]);

newValues = @(t2, v2)([t2; v2] -inv(jacobFunc(t2,v2))*[f1(t2,v2);f2(t2,v2)]); %#ok<MINV>

%Iterations
t2Init= guess2; %T2[0]
v2Init = guess1; %V2[0]


tempValues = newValues(t2Init, v2Init);
t2New = tempValues(1);
v2New = tempValues(2);

j = 1;
while(abs(t2Init - t2New) > error) && (abs(v2Init - v2New) > error) ...
        && (j < iterLimit)
    tempValues = newValues(t2New, v2New);
    t2Init = t2New;
    v2Init = v2New;
    t2New = tempValues(1);
    v2New = tempValues(2);
    j = j + 1;
end

P2New = f1(t2New,v2New) - P2;
Q2New = f2(t2New,v2New) - Q2;
t2New = t2New * (180/pi);
fprintf('T2: %f(D) \nV2: %f \nIterations: %f\n', t2New, v2New,j);
fprintf('P2New: %f \nQ2New: %f\n', P2New, Q2New);
end