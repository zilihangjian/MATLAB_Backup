function[V] = Coulomb(q0,dr,MaxStep)

eps0 = 8.85E-12;
step = 1;

for i=1:MaxStep
    if step >= 2
        r(step) = r(step-1) + dr;
    else
        r(step) = 1;
    end
    V(step) = q0./(4*pi*eps0*r(step));
        
    step = step + 1;
end

figure(1);
plot(r,V,'.r');
xlabel('r'); ylabel('V');
title('V vs r using Coulomb''s Law');
end