%Project 2.7

clear;
clc;
i_curr = [1,3];
i_curr(1,1) = .25;
i_curr(1,2) = -.25;
i_curr(1,3) = 0;
v0 = 6;
Time = [1,51];
Voltage = [1,51];
initial_t = 10e-6;
R = 100;
L = 1e-3;
C = 1e-6;
for k=1:51
    Time(1,k) = initial_t*(k-1);
end

n = 0;
while n < 3
    n = n + 1;
    dv0 = ((-1/(R*C))*v0) - ((1/C)*i_curr(1,n));
    comp1 = (1/(2*R*C));%5000
    comp2 = (1/(L*C));%1e9
    comp3 = sqrt(comp2 - comp1.^2);%3.1225e+04

    syms t;
    v1 = exp(-comp1.*t).*((cos(sqrt(comp3)*t)));%Associated with A
    v2 = exp(-comp1.*t).*((sin(sqrt(comp3)*t)));%Associated with B
    x1 = subs(v1, t, 0);
    x2 = subs(v2, t, 0);

    v3 = diff(v1);
    v4 = diff(v2);
    x3 = subs(v3, t,0);
    x4 = subs(v4,t,0);

    V = [v1, v2];
    dV = [v3, v4];

    VV = [V(1,1), V(1,2); dV(1,1), dV(1,2)];
    solution = [v0;dv0];

    AB = VV\solution;
    A = subs(AB(1,1),t,0);
    B = subs(AB(2,1),t,0);
    vfunc = @(q) exp(-comp1.*q).*((A.*cos(sqrt(comp3)*q)) + (B.*sin(sqrt(comp3).*q)));
    for g=1:51
        Voltage(1,g) = vfunc(Time(1,(g)));  
    end
    fprintf('Part %1.0f\n', n);
    fprintf('Time    |     Voltage\n');
    fprintf('---------------------\n');
    for u=1:51
    fprintf('%.6f   %1.4f\n', Time(1,u),Voltage(1,u));
    fprintf('---------------------\n');
    end
    hold on;
    title('Three Graphs of iL vs t');
    xlabel('time');
    ylabel('iL');
end
    
legend('.25','-.25','0');