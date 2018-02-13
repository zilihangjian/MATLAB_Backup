%test 2
clc;
clear all;
close all;
t = -2*pi:pi/50:2*pi;
x = abs(sin(t));

subplot(2,2,1);
plot(t,x,'r');
xlabel('X');
ylabel('Time');
grid;

subplot(2,2,2);
area(t,x);
xlabel('X');
ylabel('Time');
grid;

subplot(2,2,3);
stem(t,x,'rx');
xlabel('X');
ylabel('Time');
grid;

subplot(2,2,4);
new_t = -2*pi:pi/100:2*pi;
new_x = abs(cos(new_t));
stem(new_t,new_x,'bo');
xlabel('X');
ylabel('Time');
grid;

explode = zeros(1,201);
for n=1:201
    if mod(n,2) == 0
        explode(1,n) = 1;
    else 
        explode(1,n) = 0;
    end
end
figure();
pie(x,explode);

figure();
histogram(x);





