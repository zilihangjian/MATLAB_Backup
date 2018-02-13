clc; close all; clear;
N = 10000;
x = linspace(-1,1,N);
PDFn1 = makedist('uniform','lower',-1,'upper',1);
PDFn2 = makedist('triangular','a',-1,'b',0,'c',1);
pdfn1 = pdf(PDFn1,x);
intN1 = trapz(x,pdfn1);
pdfn2 = pdf(PDFn2,x);
intN2 = trapz(x,pdfn2);

figure()
plot(x,pdfn1, x, pdfn2);
legend('Uniform', 'Triangular');

%Create Random Stream of -1 or 1V
stream = round(rand(1,N));
[~,Ind,~] = find(stream == 0);
stream(Ind) = -1;

z = linspace(0,N);
y = linspace(0,N);
for j = 1: N
    z(j) = random(PDFn1);
    y(j) = random(PDFn2);
end
figure()
plot(x,sort(z),x,sort(y));

figure()
subplot(1,2,1);
hist(z,100);
subplot(1,2,2);
hist(y,100);

%Time Domain Representation
time = linspace(-2,2,19999);
convolution = conv(pdfn1,pdfn2)./((length(time))/4);
figure()
plot(time, convolution);
intN = trapz(time, convolution);
hold on;
t1 = linspace(-2,-1,1000);
p1 = 0.25*(t1+2).^2;
plot(t1,p1);
t2 = linspace(-1,0,1000);
p2 = 0.50*(1 - (t2.^2)/2);
plot(t2,p2);
t3 = linspace(0,1,1000);
p3 = 0.50*(1 - (t3.^2)/2);
plot(t3,p3);
t4 = linspace(1,2,1000);
p4 = 0.25*(t4-2).^2;
plot(t4,p4);
hold off

pdfNN = pdf();
figure()
plot(pdfNN);
ux = mean(pdfNN);
disp(ux);