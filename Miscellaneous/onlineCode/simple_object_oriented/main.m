clear all
close all
clc

mMS= mobile_station;
mBS = base_station;
rx_antenna_mMS = [];

k=0;
while k~=2
    k = k +1;
    tx_antenna_mMS = mMS.mobile_station_run(rx_antenna_mMS)
    rx_antenna_mMS = mBS.base_station_run(tx_antenna_mMS)
end
