%% - Compute Time to reach Full SOC - 
% This function calculates the time it takes for the capacitor to reach 
% 99.9% state of charge (SOC).

% Note: The RC equation V(t) = Vmax * (1 - e^(-t/tau)), when V(t) = Vmax,
% results in t = inf. Thus, we instead use V(t) = 0.999  * V_max

%% Inputs
% V_max: the charging voltage (or maximum voltage/100% SOC) (Volts)
% tau: time constant (seconds)

%% Outputs
% t_MAX: time it takes to reach 99.9% SOC

%% Equations
% t_MAX = -tau * ln(1 - V_target/V_max);
function t_MAX = Time2ReachMAX(V_max,tau)
    V_full = 0.999 * V_max;
    t_MAX = -tau * log(1 - V_full / V_max);
end