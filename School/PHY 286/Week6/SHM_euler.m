function [x,t] = SHM_euler(gamma,x0,v0,deltat,tmax) 
%function [x,t[ = SHM_euler(gamma,x0,v0,deltat,tmax)  
%calculate euler soltuion for SHM and return x(position) and t(time)
%SHM is x'' = -gamma.*x
%x0,v0 are intital postions and speed
%deltat is time step 
%tmax is longest time to run

tprev = 0;
xprev = x0;
vprev = v0;
count = 1;
for t=[0:deltat:tmax]
   xnext = xprev + vprev.*deltat;
   vnext = vprev - gamma.*xprev.*deltat;
   x(count) = xprev;
   v(count) = vprev;
   xprev = xnext;
   vprev = vnext;
   count = count + 1;
end

plot([0:deltat:tmax],x,'--.k');

end