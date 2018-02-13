%     % Amplitude Modulation with Large Carrier
%     % Double Sideband with Large Carrier (DSB - LC)
%     DSB_LC = (AC + messSig(j,:)).*cos(wcC*time);
%
%     % DSB_LC Envelope
%     DSB_LC1 = AC + messSig(j,:);
%     DSB_LC2 = -AC - messSig(j,:);


%     %DSB-LC Signal
%     figure();
%     plot(time,DSB_LC);
%     hold on;
%     plot(time,DSB_LC1,'r');
%     hold on;
%     plot(time,DSB_LC2,'g');
%     xlabel('Time (sec)');
%     ylabel('Amplitude');
%     title('Double Sideband with Large Carrier');