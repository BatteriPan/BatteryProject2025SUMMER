%% Compute Voltage Derivative Function
% This function calculates the rate of change of voltage over time.

%% Inputs
% V_max: charging voltage (or maximum voltage/100% SOC) (Volts)
% tau:   time constant (seconds)
% t:     time vector (seconds)

%% Outputs 
% dV_dt: rate of voltage change at different intervals along time vector

%% Equations
% dVdt = (V_max / tau) * exp(-t / tau);

function dV_dt = ComputeVoltageDerivative(V_max, tau, t)
    dV_dt = (V_max / tau) * exp(-t / tau);
end