syms x
f = symfun(-2.0.*log10(0.08108 + 0.0001826.*(1/(x.^(1/2)))) - 1/(x^(1/2)), x);
d = diff(f, x);
newtraph2(f,d,0.05,5)