a = 0;
b = 1;
output = zeros(4,1);
if a && a
    output(1,1) = 1;
else
    output(1,1) = 0;
end

if a && b
    output(2,1) = 1;
else
    output(2,1) = 0;
end

if b && a
    output(3,1) = 1;
else
    output(3,1) = 0;
end

if b && b
    output(4,1) = 1;
else
    output(4,1) = 0;
end

column1 = [a;a;b;b];
column2 = [a;b;a;b];
disp('Logical AND');
and = table(column1,column2,(output));
disp(and);
a = 0;
b = 1;
output1 = zeros(4,1);
if a || a
    output1(1,1) = 1;
else
    output1(1,1) = 0;
end

if a || b
    output1(2,1) = 1;
else
    output1(2,1) = 0;
end

if b || a
    output1(3,1) = 1;
else
    output1(3,1) = 0;
end

if b || b
    output1(4,1) = 1;
else
    output1(4,1) = 0;
end

column3 = [a;a;b;b];
column4 = [a;b;a;b];
disp('Logical OR');
or = table(column3,column4,(output1));
disp(or);



a = 0;
b = 1;
output2 = zeros(4,1);
if ~(a && a)
    output2(1,1) = 1;
else
    output2(1,1) = 0;
end

if ~(a && b)
    output2(2,1) = 1;
else
    output2(2,1) = 0;
end

if ~(b && a)
    output2(3,1) = 1;
else
    output2(3,1) = 0;
end

if ~(b && b)
    output2(4,1) = 1;
else
    output2(4,1) = 0;
end

column5 = [a;a;b;b];
column6 = [a;b;a;b];

disp('Logical NAND');
nand = table(column5,column6,(output2));
disp(nand);