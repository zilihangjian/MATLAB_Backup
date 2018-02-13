classdef base_station
    
    properties
    end
    
    methods
        function tx_antenna = base_station_run(thebase_station,rx_antenna)
            data_rx = rx_run(rx_antenna);
            data    = dsp_run(data_rx);
            tx_antenna = tx_run(data);
        end
    end
end


function data_rx = rx_run(antenna)
    data_rx = antenna;
end

function data    = dsp_run(data_rx)
    if strcmp('MS:please connect me.', data_rx)
        data = 'BS:i connected you.';
    else
        data = [];
    end
end

function antenna = tx_run(data)
    antenna = data;
end