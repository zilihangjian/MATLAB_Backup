% Code to send an email with an attachment.
clc;

%------------ Set up server ---------------------------------------------------
% Server:     mbmail.yourdomain.com
% User:       iamail
% Password:   NCFPyAR6
myUserName = 'iamail';
myPassword = 'NCFPyAR6';

% NOTE: CHANGE THE 2 LINES OF CODE WITH mySMTP and sendersEmail TO REFLECT YOUR SETTINGS.
mySMTP = 'mbmail.yourdomain.com';
% Assign the sender's email address.  It can be an actual, real e-mail address,
% but it does not have to be an account that actually exists - you can make up one.
sendersEmail = 'analyst@yourdomain.com';

% Get the domain so we can see if we can send emails from this computer or not.
% Some domains have firewall restrictions!
userProfile = getenv('USERDOMAIN');

% Get the email of the user who logged in to the computer.
userProfile = getenv('USERPROFILE');
lastSlashLocation = find(userProfile == '\', 1, 'last');
usersEmail = [userProfile(lastSlashLocation + 1 : end) '@yourdomain.com'];

% Set your email and SMTP server address in MATLAB.
setpref('Internet', 'SMTP_Server', mySMTP)
setpref('Internet', 'E_mail', sendersEmail)
setpref('Internet','SMTP_Username', myUserName);
setpref('Internet','SMTP_Password', myPassword);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');

%------------ Set up recipient(s) email addresses ---------------------------------------------------
% Send an email to recipient with the file attached.
% recipient = sendersEmail; % Send to yourself.
recipientsEMail = 'end_user@yourdomain.com'; % Change this to the actual recipient.
emailList = {recipientsEMail};

% % For multiple recipients (separated by command, spaces, or semicolons), uncomment the 4 lines below.
% recipientsEMail = strrep(recipientsEMail, ' ', ';')
% recipientsEMail = strrep(recipientsEMail, ',', ';')
% % allwords can be found here: http://www.mathworks.com/matlabcentral/fileexchange/27184-allwords
% emailList = allwords(recipientsEMail, ';')

%------------ Attach file ---------------------------------------------------
% Have user browse and specify the full file name of the file to attach.
% startingFolder = pwd;
startingFolder = 'C:\Users\Public\Documents'; % Wherever you want.
defaultFileName = fullfile(startingFolder, '*.*');
% Let user browse to attach a file.
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a file to attach to the e-mail.');
if baseFileName == 0
	% User clicked the Cancel button.
	return;
end
attachedFullFileName = fullfile(folder, baseFileName); % Combine folder and base name into full file name.

%------------ Prepare subject line ---------------------------------------------------
% Prepare the subject line.
subjectLine = 'Your test results are attached.';

%------------ Prepare the message body ---------------------------------------------------
% Prepare the message body of the e-mail.
% Outlook quirk.  Read if your recipient will be using Microsoft Outlook to read your message.
% Microsoft Outlook has a default setting where it will remove line breaks that it thinks are unnecessary.
% It will keep line breaks if the last character before it is a period, but for others, it seems to randomly
% and arbitrarily remove some of them.  To get around this, 
% the workaround (http://www.emailsignature.eu/phpBB2/outlook-is-stripping-line-breaks-from-plain-text-emails-t1775.html)
% is to put three spaces in front of EACH line in the email
messageBody = sprintf('   The R&D Lab is pleased to deliver the results from');
messageBody = sprintf('%s\n   the Test that you requested.', messageBody);
messageBody = sprintf('%s\n   Your results are in the attached Excel workbook.', messageBody);
messageBody = sprintf('%s\n\n   Please do not reply to this email because it is not monitored.', messageBody);
messageBody = sprintf('%s\n   If you have any questions, requests, concerns, or comments,', messageBody);
messageBody = sprintf('%s\n   please contact your analyst, or %s (who ran this test).', messageBody, usersEmail);

%------------ Send the message(s) ---------------------------------------------------
% Here's where we actually send out the e-mail(s) to the recipient(s) with the file attached.
for k = 1 : length(emailList);
	% Get this email.
	thisRecipient = emailList{k};
	% Echo stuff to the command line.
	thisRecipient
	subjectLine
	messageBody
	attachedFullFileName
	% Do the actual sending.
	sendmail(recipientsEMail, subjectLine, messageBody, attachedFullFileName)
end

%------------ Confirmation ---------------------------------------------------
% Alert sender that the message, with attached file, has been sent.
message = sprintf('Done!\nThe email has been sent from\n\n%s\n\nto\n\n%s\n\nwith the attached file:\n\n%s',...
	sendersEmail, recipientsEMail, attachedFullFileName);
msgbox(message);