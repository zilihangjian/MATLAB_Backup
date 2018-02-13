function [mx,mx2] = meanDrunkenWalk(N,M,ssize)
    mx = zeros(1,N);
    mx2 = zeros(1,N);
    
    for m=1:M
        x = drunkenwalk(N,ssize);
        mx = mx + x;
        mx2 = mx2 + x.^2;
    end
    mx = mx./M;
    mx2 = mx2./M;
    
    figure(1);
    plot(mx);
    figure(2);
    plot(mx2);
    
    hold on; figure(3);
    for n=1: 1000
        x = drunkenwalk(100);
        plot(x);
    end
end