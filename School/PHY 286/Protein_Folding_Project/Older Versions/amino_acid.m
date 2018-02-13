classdef amino_acid
    
    properties
        starting_coordinate;
        ending_coordinate;
    end
    
    methods
        function tx_antenna = base_station_run(thebase_station,rx_antenna)
            data_rx = rx_run(rx_antenna);
            data    = dsp_run(data_rx);
            tx_antenna = tx_run(data);
        end
    end
end