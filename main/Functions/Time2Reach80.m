%% - Compute Time to reach 80% SOC Function -
% This function calculates the time it takes for the capacitor to reach 
% 80% state of charge (SOC).

%% Inputs
% V_80: Voltage at 80% SOC (Volts)
% V_max: the charging voltage (or maximmum voltage/100% SOC) (Volts)
% tau: time constant (seconds)

%% Outputs
% t_80: time it takes to reach 80% SOC

%% Equations
% t = -tau * ln(1 - V_80 / V_max)
function t_80 = Time2Reach80(V_start, V_80,V_max,tau)
    t_80 = -tau * log(1 - V_80 / (V_max - V_start));
end