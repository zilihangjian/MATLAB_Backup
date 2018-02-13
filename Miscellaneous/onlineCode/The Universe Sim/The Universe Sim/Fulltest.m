function Fulltest() % TEST FUNCTION TO DETERMINE THE NUMBER OF PLANETS WITH WATER AND LIFE FOR STATISTICAL ANALYSIS OF PROGRAM
a = 0;
b = 0;
c = zeros(1,1000);
for i = 1:1000
while a == 0
    [x,y] = Tester;
    if x == 1 && y > 0 && y < 100
        a = 1;
    end
    b = b+1;
    fprintf('.');
end
c(i) = b;
a = 0;
end
1/(c(1000)/1000)*100
end