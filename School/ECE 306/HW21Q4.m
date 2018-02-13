% func_t = @(t) (6*sin(-20 + 4*t))/(-5*pi + pi*t);
func_t = @(t) (7*sin(-20 + 5*t))/(-4*pi + pi*t);
A = fplot(func_t,[3.9,4.1]);
i = 3.9;
max_value = 0;
max_time = 0;
while i < max(A)
    check = func_t(i);
    if check > max_value
        max_value = check;
        max_time = i;
    end
    i = i + .01;
end
keyboard
