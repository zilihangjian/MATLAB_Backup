%% =>- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% ECE493/593 Sp17 Project - Flyback Power Loss %%
%
%  Power Loss Calculations
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% HOUSEKEEPING
clear; clc;
addpath(genpath('H:\Code\Matlab\Marks_Functions'));  % Add Directory for Functions
j = sqrt(-1);

%% VARIABLES
PV_low  = 30;
PV_high = 45;
V_dc_out = 200;
P_out_min = 200;
P_out_max = 300;
fs = 50e3;

I_out = P_out_max / V_dc_out;

%% Device Parameters - From Datasheet
% Infineon IPL65R070C7

R_dson = 0.062;
td_on = 14e-9;
tr = 6e-9;
td_off = 92e-9;
tf = 11e-9;

ton = td_on + tr;
toff = td_off + tf;

VF = 0.8;
Qrr = 10e-6;

R_jc = 0.74;
R_ja = 62

%% Ambient Conditions
Ta = 40;
Tj_max = 100;
R_cs = 1;

%% From Code: ECE493_Sp17_MiniProject_Inv_Loss.m

P_Inv_loss =     0.9559;
P_Q1_Tot = P_Inv_loss/4;

%% Calculations

I_out = P_out_max / V_dc_out;

N2_N1(1) = 4;  % Turns Ratio From Excel Spreadsheet
N2_N1(2) = 5;  % Turns Ratio From Excel Spreadsheet
N2_N1(3) = 6;  % Turns Ratio From Excel Spreadsheet

% Calculate the low end duty cycle and high end duty cycle
% for each of the three turns ratios.

VDC = PV_low:1:PV_high;

% Calculate Duty Cycle for each case
for i=1:length(N2_N1)
    for j=1:length(VDC)
        D(i,j) = V_dc_out/(V_dc_out + N2_N1(i)*VDC(j));
    end
    % Calculate the Mutual Inductance for CCM Mode
    LM(i) = 1/2*V_dc_out^2*(1-D(i,length(VDC)))^2/P_out_min/fs/(N2_N1(i))^2;
end



% Iterate Once for each Turns Ratio
for i=1:length(N2_N1)
    % Iterate Once for Each Duty Cycle
    for j=1:length(VDC)
        
        % Calculate the Average and Peak-to-Peak Inductor Current
        I_L_avg(i,j)  = N2_N1(i)*I_out/(1-D(i,j));
        I_Lm_pp(i,j)  = VDC(j)*D(i,j)/LM(i)/fs;
    
        % Calculate the RMS Current Through Q5        
        I_Q5_max(i,j) = I_L_avg(i,j) + 1/2*I_Lm_pp(i,j);
        I_Q5_min(i,j) = I_L_avg(i,j) - 1/2*I_Lm_pp(i,j);
        I_Q5_rms(i,j) = sqrt(D(i,j)*(I_Q5_min(i,j)^2 + ...
                             I_Q5_min(i,j)*(I_Q5_max(i,j) - I_Q5_min(i,j)) + ...
                             1/3*(I_Q5_max(i,j) - I_Q5_min(i,j))^2));

        % Calculate the RMS and Average Current Through Q6                            
        I_Q6_min(i,j) = I_Q5_min(i,j)/N2_N1(i);
        I_Q6_max(i,j) = I_Q5_max(i,j)/N2_N1(i);

        I_Q6_rms(i,j) = sqrt((1-D(i,j))*(I_Q6_min(i,j)^2 + ...
                     I_Q6_min(i,j)*(I_Q6_max(i,j) - I_Q6_min(i,j)) + ...
                     1/3*(I_Q6_max(i,j) - I_Q6_min(i,j))^2));
        
        I_Q6_avg(i,j) = 1/2*(1-D(i,j))*(I_Q6_max(i,j) - I_Q6_min(i,j)) + ...
                        (1-D(i,j))*I_Q6_min(i,j);
                    
        % Calculate the Conduction Losses for Q5
        P_Q5_con(i,j) = (I_Q5_rms(i,j))^2*R_dson;
        
        % Calculate the Switching Losses for Q5
        P_Q5_sw(i,j)  = 1/2*(VDC(j)/(1-D(i,j)))*(I_Q5_min(i,j)*ton + ...
                                                 I_Q5_max(i,j)*toff)*fs;
                                             
        % Calculate the Total Loss for Q5
        P_Q5_tot(i,j) = P_Q5_con(i,j) + P_Q5_sw(i,j);

        
        % Calculate the Conduction Losses for Q6 as a Diode
        P_Q6_con1(i,j) = (I_Q6_avg(i,j)*VF);
        
        % Calculate the Switching Losses for Q6 as a Diode
        P_Q6_sw1(i,j) = Qrr*fs*abs(-N2_N1(i)*VDC(j)/(1-D(i,j)));
                                               
        % Calculate the Total Loss for Q6 as a Diode
        P_Q6_tot1(i,j) = P_Q6_con1(i,j) + P_Q6_sw1(i,j);      
        
        % Calculate the Conduction Losses for Q6 as Synchronous Rectifier
        P_Q6_con2(i,j) = (I_Q6_rms(i,j))^2*R_dson;
        
        % Calculate the Switching Losses for Q6 as Synchronous Rectifier
        P_Q6_sw2(i,j)  = 1/2*(VDC(j)/(1-D(i,j))*N2_N1(i))*(I_Q6_min(i,j)*ton + ...
                                                 I_Q6_max(i,j)*toff)*fs;
                                             
        % Calculate the Total Loss for Q6 as Synchronous Rectifier
        P_Q6_tot2(i,j) = P_Q6_con2(i,j) + P_Q6_sw2(i,j);

        P_sys_Loss1(i,j) = P_Inv_loss + P_Q5_tot(i,j) + P_Q6_tot1(i,j);
        P_sys_Loss2(i,j) = P_Inv_loss + P_Q5_tot(i,j) + P_Q6_tot2(i,j);
        
        n1(i,j) = (P_out_max - P_sys_Loss1(i,j))/P_out_max;
        n2(i,j) = (P_out_max - P_sys_Loss2(i,j))/P_out_max;
        
    end
    [P_Q5_MaxLoss(i), D_Q5_MaxLoss(i)] = max(P_Q5_tot(i,j));
    [P_Q6_MaxLoss1(i), D_Q6_MaxLoss1(i)] = max(P_Q6_tot1(i,j));
    [P_Q6_MaxLoss2(i), D_Q6_MaxLoss2(i)] = max(P_Q6_tot2(i,j));
    
    D_Q5_MaxLoss(i)  = P_Q5_tot(i,D_Q5_MaxLoss(i));
    D_Q6_MaxLoss1(i) = P_Q6_tot1(i,D_Q6_MaxLoss1(i));
    D_Q6_MaxLoss2(i) = P_Q6_tot2(i,D_Q6_MaxLoss2(i));

    % Peform Thermal Calculations
    Ts_Q5(i)   = Tj_max - P_Q5_MaxLoss(i)*(R_cs + R_jc);
    Ts_Q6_1(i) = Tj_max - P_Q6_MaxLoss1(i)*(R_cs + R_jc);
    Ts_Q6_2(i) = Tj_max - P_Q6_MaxLoss2(i)*(R_cs + R_jc);
    
    if (Ts_Q5(i) > Ts_Q6_1(i))
       R_sa_1(i) = (Ts_Q5(i)-Ta)/(P_Q5_MaxLoss(i)+ P_Q6_MaxLoss1(i))
    else
       R_sa_1(i) = (Ts_Q6_1(i)-Ta)/(P_Q5_MaxLoss(i)+ P_Q6_MaxLoss1(i))
    end
    
    if (Ts_Q5(i) > Ts_Q6_2(i))
       R_sa_2(i) = (Ts_Q5(i)-Ta)/(P_Q5_MaxLoss(i)+ P_Q6_MaxLoss2(i))
    else
       R_sa_2(i) = (Ts_Q6_2(i)-Ta)/(P_Q5_MaxLoss(i)+ P_Q6_MaxLoss2(i))
    end
    

end











