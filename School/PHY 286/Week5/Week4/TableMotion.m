%TableMotion
clc;
for j=1:5
    [x,y,Vx,Vy] = ProjectileMotion((15*j),100,.05,1,.01,9.8);
    Index = [1:length(x)];
    for n=1:length(x)
        Index(1,n) = n;
    end
    Index = Index';
    x = x';
    y = y';
    Vx = Vx';
    Vy = Vy';
    t = table(Index,x,y,Vx,Vy);
    disp(t);
    hold on;
    ylim([0,1000])
    plot(x,y);
end
