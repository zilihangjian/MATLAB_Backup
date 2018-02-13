%% =>- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% ECE493/593 Sp17 Project - Plot Total Losses %%
%
%  Plot the Results
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure(10)
    plot(VDC,P_Q5_tot(1,:),'r',VDC,P_Q5_tot(2,:),'b',VDC,P_Q5_tot(3,:),'k','LineWidth',2);
    xlabel('PV Voltage (V)', 'FontSize', 20, 'FontWeight','Bold');
    ylabel('Q_5 Power Loss (W)', 'FontSize', 20, 'FontWeight','Bold');
    title('Q_5 Power Loss vs. Input Voltage', 'FontSize', 20, 'FontWeight','Bold');
    legend('N_2:N_1=4','N_2:N_1=5','N_2:N_1=6');
    set(gca,'FontSize',16);
    
figure(11)
    plot(VDC,P_Q6_tot1(1,:),'r',VDC,P_Q6_tot1(2,:),'b',VDC,P_Q6_tot1(3,:),'k','LineWidth',2);
    xlabel('PV Voltage (V)', 'FontSize', 20, 'FontWeight','Bold');
    ylabel('Q_6 Power Loss (W)', 'FontSize', 20, 'FontWeight','Bold');
    title('Q_6 Power Loss (Diode) vs. Input Voltage', 'FontSize', 20, 'FontWeight','Bold');
    legend('N_2:N_1=4','N_2:N_1=5','N_2:N_1=6');
    set(gca,'FontSize',16);
    
figure(12)
    plot(VDC,P_Q6_tot2(1,:),'r',VDC,P_Q6_tot2(2,:),'b',VDC,P_Q6_tot2(3,:),'k','LineWidth',2);
    xlabel('PV Voltage (V)', 'FontSize', 20, 'FontWeight','Bold');
    ylabel('Q_6 Power Loss (W)', 'FontSize', 20, 'FontWeight','Bold');
    title('Q_6 Power Loss (S.R.) vs. Input Voltage', 'FontSize', 20, 'FontWeight','Bold');
    legend('N_2:N_1=4','N_2:N_1=5','N_2:N_1=6');
    set(gca,'FontSize',16);
    
 figure(13)
    plot(VDC,P_sys_Loss1(1,:),'r',VDC,P_sys_Loss1(2,:),'b',VDC,P_sys_Loss1(3,:),'k','LineWidth',2);
    xlabel('PV Voltage (V)', 'FontSize', 20, 'FontWeight','Bold');
    ylabel('Q_6 Power Loss (W)', 'FontSize', 20, 'FontWeight','Bold');
    title('Q_6 Power Loss (Diode) vs. Input Voltage', 'FontSize', 20, 'FontWeight','Bold');
    legend('N_2:N_1=4','N_2:N_1=5','N_2:N_1=6');
    set(gca,'FontSize',16);
    
figure(14)
    plot(VDC,P_sys_Loss2(1,:),'r',VDC,P_sys_Loss2(2,:),'b',VDC,P_sys_Loss2(3,:),'k','LineWidth',2);
    xlabel('PV Voltage (V)', 'FontSize', 20, 'FontWeight','Bold');
    ylabel('Q_6 Power Loss (W)', 'FontSize', 20, 'FontWeight','Bold');
    title('Q_6 Power Loss (S.R.) vs. Input Voltage', 'FontSize', 20, 'FontWeight','Bold');
    legend('N_2:N_1=4','N_2:N_1=5','N_2:N_1=6');
    set(gca,'FontSize',16);

figure(15)
    plot(VDC,n1(1,:),'r',VDC,n1(2,:),'b',VDC,n1(3,:),'k','LineWidth',2);
    xlabel('PV Voltage (V)', 'FontSize', 20, 'FontWeight','Bold');
    ylabel('Efficiency', 'FontSize', 20, 'FontWeight','Bold');
    title('Efficiency (Q_6 Diode) vs. Input Voltage', 'FontSize', 20, 'FontWeight','Bold');
    legend('N_2:N_1=4','N_2:N_1=5','N_2:N_1=6');
    set(gca,'FontSize',16);

figure(16)
    plot(VDC,n2(1,:),'r',VDC,n2(2,:),'b',VDC,n2(3,:),'k','LineWidth',2);
    xlabel('PV Voltage (V)', 'FontSize', 20, 'FontWeight','Bold');
    ylabel('Efficiency', 'FontSize', 20, 'FontWeight','Bold');
    title('Efficiency (Q_6 S.R.) vs. Input Voltage', 'FontSize', 20, 'FontWeight','Bold');
    legend('N_2:N_1=4','N_2:N_1=5','N_2:N_1=6');
    set(gca,'FontSize',16);