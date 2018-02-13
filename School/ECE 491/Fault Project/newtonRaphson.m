function [v3,t2,t3] = newtonRaphson(guess1, guess2, guess3, error, iterLimit)
%function [] = problem3(guess1, guess2, guess3,error, iterLimt)

%Variables / Function Declarations
%YBus Matrix
XT12 = 0.10i;
XT13 = 0.14i;
XT21 = 2.50i;
XT3 = 0.20i;
X12 = 0.50i;
X13 = 0.210i;
X23 = 0.299i;
XG1 = 0.502i;
XM1 = 0.006i;
XT2 = 0.10i;

Y11 = (1 / (XT12 + X12 + XT21 + XT13 + X23));
Y12 = (-1 /(XT12 + X12 + XT21));
Y13 = (-1 / (XT13 + X13));
Y21 = (-1 / (XT21 + X12 + XT12));
Y22 = (1 / (XT21 + X12 + XT12 + X23));
Y23 = ((-1 / X23));
Y31 = (-1 / (X13 + XT13));
Y32 = (-1 / X23);
Y33 = (1 / (X13 + XT13 + X23));

Ybus = [Y11, Y12, Y13; Y21, Y22, Y23; Y31, Y32, Y33];
G = real(Ybus);
B = imag(Ybus);

%Given Values
P2 = 0.25; P3 = -0.30; Q3 = -0.10;
v1 = 1;
v2 = 0.94;
t1 = 0;
%P2 = (v1*v2)*(G(2,1)*cos(t2 - t1) + B(2,1)*sin(t2 - t1)) +
%(v2.^2)*(G(2,2)*cos(t2-t2) + B(2,2)*sin(t2-t2)) +
%(v2*v3)*(G(2,3)*cos(t2-t3) + B(2,3)*sin(t2-t3))

%P3 = (v1*v3)*(G(3,1)*cos(t3 - t1) + B(3,1)*sin(t3 - t1)) +
%(v2*v3)*(G(3,2)*cos(t3-t2) + B(3,2)*sin(t3-t2)) +
%(v3*v3)*(G(3,3)*cos(t3-t3) + B(3,3)*sin(t3-t3))

%Q3 = (v1*v3)*(G(3,1)*sin(t3 - t1) - B(3,1)*cos(t3 - t1)) +
%(v2*v3)*(G(3,2)*sin(t3-t2) + B(3,2)*cos(t3-t2)) +
%(v3*v3)*(G(3,3)*sin(t3-t3) + B(3,3)*cos(t3-t3))

%Unknowns V2 and T2
% f1 = @(v3, t2, t3)(-P2 + (v1*v2)*(G(2,1)*cos(t2 - t1) + B(2,1)*sin(t2 - t1)) + ...
% (v2.^2)*(G(2,2)*cos(t2-t2) + B(2,2)*sin(t2-t2)) +...
% (v2*v3)*(G(2,3)*cos(t2-t3) + B(2,3)*sin(t2-t3)));%P2
% 
% f2 = @(v3, t2, t3)(-P3 + (v1*v3)*(G(3,1)*cos(t3 - t1) + B(3,1)*sin(t3 - t1)) + ...
% (v2*v3)*(G(3,2)*cos(t3-t2) + B(3,2)*sin(t3-t2)) + ...
% (v3*v3)*(G(3,3)*cos(t3-t3) + B(3,3)*sin(t3-t3)));%P3
% 
% f3 = @(v3, t2, t3)(-Q3 + (v1*v3)*(G(3,1)*sin(t3 - t1) - B(3,1)*cos(t3 - t1)) + ...
% (v2*v3)*(G(3,2)*sin(t3-t2) + B(3,2)*cos(t3-t2)) + ...
% (v3*v3)*(G(3,3)*sin(t3-t3) + B(3,3)*cos(t3-t3)));%Q3

syms v3 t2 t3;
f1 = @(v3, t2, t3)(-P2 + (v1*v2)*(B(2,1)*sin(t2 - t1)) + ...
(v2*v3)*(B(2,3)*sin(t2-t3)));%P2

f2 = @(v3, t2, t3)(-P3 + (v1*v3)*B(3,1)*sin(t3 - t1)) + ...
(v2*v3)*(B(3,2)*sin(t3-t2));%P3

f3 = @(v3, t2, t3)(-Q3 + (v1*v3)*(-B(3,1)*cos(t3 - t1)) + ...
(v2*v3)*(-B(3,2)*cos(t3-t2)) + (v3*v3)*(-B(3,3)));%Q3

% jacob = jacobian([sym(f1),sym(f2)], [theta1, theta2]);
jacobFunc = @(v3,t2,t3)([...
    v2*B(2,3)*sin(t2-t3),...%(1,1)
    ...
    v2*B(2,1)*cos(t2) + v2*v3*B(2,3)*cos(t2-t3),...%(1,2)
    ...
    -v2*v3*B(2,3)*cos(t2-t3);...%(1,3)
    ...
    B(3,1)*sin(t3) + v2*B(3,2)*sin(t3-t2),...%(2,1)
    ...
    -v2*v3*B(3,2)*cos(t3-t2),...%(2,2)
    ...
    v2*v3*B(3,2)*cos(t3-t2);...%(2,3)
    ...
    -B(3,1)*cos(t3) - v2*B(3,2)*cos(t3-t2) - 2*v3*B(3,3),...%(3,1)
    ...
    v2*v3*B(3,2)*sin(t3-t2),...%(3,2)
    ...
    v3*B(3,1)*sin(t3) + v2*v3*B(3,2)*sin(t3-t2)]);%(3,3)

newValues = @(v3,t2,t3)([v3;t2;t3] -inv(jacobFunc(v3,t2,t3))...
    *[f1(v3, t2, t3);f2(v3, t2, t3);f3(v3, t2, t3)]);
%Iterations
v3Init = guess1; %V3[0]
t2Init= guess2; %T2[0]
t3Init = guess3; %T3[0]

tempValues = newValues(v3Init,t2Init,t3Init);
v3New = tempValues(1);
t2New = tempValues(2);
t3New = tempValues(3);

j = 1;
while(abs(v3Init - v3New) > error) && (abs(t3Init - t3New) > error) &&...
      (abs(t2Init - t2New) > error)  && (j < iterLimit)
    tempValues = newValues(v3New, t2New, t3New);
    v3Init = v3New;
    t2Init = t2New;
    t3Init = t3New;
    v3New = tempValues(1);
    t2New = tempValues(2);
    t3New = tempValues(3);
    j = j + 1;
end

v3 = v3New; t2 = t2New; t3 = t3New;
end