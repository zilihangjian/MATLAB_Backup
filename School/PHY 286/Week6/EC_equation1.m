function [x,t] = EC_equation1(x0,v0,deltat,tmax,Fd,q,R,m) 

xprev = x0;
vprev = v0;
count = 1;
omega = sqrt(R/m);
for t=[0:deltat:tmax]
   vnext = vprev - ((R./m).*xprev + (q./m).*vprev - (Fd./m).*sin(omega.*t)).*deltat;
   xnext = xprev + vnext.*deltat;
   x(count) = xprev;
   v(count) = vprev;
   xprev = xnext;
   vprev = vnext;
   count = count + 1;
end

plot([0:deltat:tmax],x,'--.k');

end