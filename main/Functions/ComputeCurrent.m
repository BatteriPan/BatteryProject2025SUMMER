% -Compute Current Function-
% This function calculates the current flowing into a capacitor (or battery)
% during the charging process in an RC circuit. The current decays 
% exponentially over time from its maximum value, based on the time constant (tau)

%% Inputs
% V_max - Maximum charging voltage (Volts)
% R     - Equivalent resistance in the circuit (Ohms)
% tau   - Time constant (Seconds)
% t     - Time vector (Seconds)

%% Outputs
% I_t   - Current vector over time (Amps)

%% Equation
% I(t) = (V_max / R)*e^(-t/tau)

function I_t = ComputeCurrent(V_start, V_max, R, tau, t)
    I_t = ((V_max - V_start) / R) * exp(-t / tau);
end


