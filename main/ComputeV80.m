%% - Compute Time to reach 80% SOC Function -
% This function calculates the voltage at 80% state of charge (SOC).
% It is important to note that 0% state of
% charge does not necessarily mean 0 volts.

%% Inputs
% V_start: Voltage at 0% SOC (Volts)
% V_max: the charging voltage (or maximmum voltage/100% SOC) (Volts)

%% Outputs
% V_80: voltage at 80% SOC

%% Equations
% V_80 = V_start + 0.8 *(V_max - V_start)

function V_80 = ComputeV80(V_start,V_max)
    V_80 = V_start + 0.8 * (V_max - V_start);
end