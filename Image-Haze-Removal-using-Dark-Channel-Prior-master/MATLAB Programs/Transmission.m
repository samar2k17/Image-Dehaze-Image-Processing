function [transmission] = Transmission(omega,darkchannel,A)
transmission = 255 - omega.*darkchannel./A; 
end

