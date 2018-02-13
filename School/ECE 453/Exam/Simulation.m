%Simulation
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

numSim = 10000;
for j = 1: numSim
    
end