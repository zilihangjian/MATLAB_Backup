% CAS325M12HM2

%MOSFET Curve Fitting
load('VDS_ID.mat')
[VGS1,ID1] = parseData(VDS_ID);
transC1 = fit(VGS1, ID1,'poly1');
coeff1 = coeffvalues(transC1);