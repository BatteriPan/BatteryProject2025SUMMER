%% -Compute Voltage Function-
% This function calculates the voltage across a capacitor (or battery terminal)
% during charging in an RC circuit. The voltage increases exponentially 
% over time toward a maximum voltage (V\_max) based on the time constant (tau).

%% Inputs
% V_max - Maximum Charging Voltage (Volts)
% tau   - Time Constant (Seconds)
% t:    - Time Vector (Seconds)

%% Outputs
% V_t   - Voltage vector over time

%% Equations 
% V(t) = V_max (1 - e^{-t/tau})

function V_t = ComputeVoltage(V_max, tau, t)
    V_t = V_max * (1 - exp(-t / tau));
end


