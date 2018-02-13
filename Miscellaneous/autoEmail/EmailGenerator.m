function [] = EmailGenerator(recipients)
% function [] = EmailGenerator(recipients)
%recipients is a vector of strings containing the different 

currentMailA = 'JSwqMnbGj@gmail.com';
pPrompt = sprintf('E-Mail Password for %s | ', currentMailA);
currentMailP = input(pPrompt);
setpref('Internet', 'Email', currentMailA);
setpref('Internet', 'SMPT_Server', 'smtp.gmail.com');
setpref('Internet','SMTP_Username',currentMailA);
setpref('Internet','SMTP_Password',currentMailP);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

for j = 1: length(recipients)
    sendmail(recipients(j),'Auto Generated Email for Controls HW',...
    {'C:\Users\John\Documents\MATLAB\DanProblem.m'});
end
end