%% -Compute Power Function-
% This function calculates the voltage across a capacitor (or battery terminal) during charging in an RC circuit. The voltage increases exponentially over time toward a maximum voltage (V\_max) based on the time constant (tau).

%% Inputs
% V_t - Voltage vector over time (Volts)
% I_t - Current vector over time (Amps)

%% Outputs
% P_t - Instantaneous power vector over time (Watts)

%% Equations 
% P(t) = V(t) * I(t)
function P_t = ComputePower(V_t, I_t)
    P_t = V_t .* I_t;
end

