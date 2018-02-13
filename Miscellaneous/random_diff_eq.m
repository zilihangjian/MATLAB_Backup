%Part 1
clear; 
figure(1);
subplot(2,1,1)
xmin=-1; 
xmax=5; 
x=xmin:0.02:xmax;
c1 = [9/13, -18/13,-17/13 , 0, 18/13, 27/13, 36/39];  
c2 = [4/13, -8/3, -4/13, 0, 8/13, 12/13, 16/13];
c3 = [18/13, -36/39, -34/39, 0, 16/39, 54/39, 72/39]; 
for t = 1: 7
    y = c1(t)*exp(-2*x) + c2(t)*cos(3*x) + c3(t)*sin(3*x);
    plot(x,y) 
    grid on 
    axis([xmin xmax -2 3]); %The numbers in this list are the x and y boundaries for the graph. 
    hold on 
end
legend('a = 1', 'a = -2','a = -1','a = 0','a = 2', 'a = 3', 'a = 4');

%Part 2 
subplot(2,1,2);
xmin=-1; 
xmax=5; 
x=xmin:0.02:xmax;
c1 = 9/13; 
c2 = 4/13;
c3 = [-3, -8/39, 25/39, 18/39, 49/39, 4/3, 75/39]; 
for t = 1: 7
    y = c1*exp(-2*x) + c2*cos(3*x) + c3(t)*sin(3*x);
    plot(x,y) 
    grid on 
    axis([xmin xmax -2 3]); %The numbers in this list are the x and y boundaries for the graph. 
    hold on 
end
legend('b = -3', 'b = -2','b = -1','b = 0','b = 1', 'b = 2', 'b = 3');