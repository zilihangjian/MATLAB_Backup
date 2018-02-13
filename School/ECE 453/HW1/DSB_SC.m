% Amplitude Modulation with Suppressed Carrier
% Double Sideband with Suppressed Carrier (DSB-SC)
% for j = 1:length(AM)
%     DSB_SC = messSig.*carr;
%     DSB_SC Envelope
%     DSB_SC1 = AM(j)*AC*(cos(wcM*time));
%     DSB_SC2 = -AM(j)*AC*(cos(wcM*time));
%     
%     DSB-SC Signal
%     figure();
%     plot(time,DSB_SC);
%     hold on;
%     plot(time,DSB_SC1,'r');
%     plot(time,DSB_SC2,'g');
%     xlabel('Time (s)');
%     ylabel('Amplitude');
%     title('Double Sideband with Suppressed Carrier');
%     hold off;
% end