classdef mobile_station < handle
   
    properties
        am_i_connected =0
    end
    
    methods
        function tx_antenna = mobile_station_run(themobile_station,rx_antenna)
            data_rx = rx_run(rx_antenna);
            data    = dsp_run(themobile_station,data_rx);
            tx_antenna = tx_run(data);
        end
    end
    
end

function data_rx = rx_run(antenna)
    data_rx = antenna;
end

function data    = dsp_run(themobile_station,data_rx)
    if strcmp('BS:i connected you.', data_rx)
        data = 'MS:i am online.';
        themobile_station.am_i_connected = 1;
    else
        if themobile_station.am_i_connected == 1
            data = [];
        else
            data = 'MS:please connect me.';
        end
    end
end

function antenna = tx_run(data)
    antenna = data;
end