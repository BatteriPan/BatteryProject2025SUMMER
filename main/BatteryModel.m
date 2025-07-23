%%  -Battery Charging Model-
% This live script models the charging behavior of a lithium-ion battery
% using an RC (resistor-capacitor) circuit approximation. The parameters are 
% based on the Panasonic NCA103450 cell. The script calculates voltage, 
% current, and power over time, and visualizes each with a plot.

% Clear Workspace
clear , clc, close all;

%% Define Constants 
% These values are estimated to give a realistic time constant for charging. 
% You can modify R and C to simulate different battery conditions.

V_max = 4.2;    % Maximum charging voltage (Volts)
R = 0.25;       % Equivalent resistance (Ohms)
C = 11520;      % Equivalent capacitance (Farads) 

%% Set up Time Vector 
% Time resolution can be adjusted to smooth curves in the plots 
tau = R * C;            % Time constant (tau) 
t_end = 5 * tau;        % Total simulation time (~99% charge)
t = 0:0.01:t_end;       % Time vector with 0.01-second intervals

%% Analysis: Time to reach 80% and 100% SOC
% Calculate the coltage at 80% SOC (assuming start at 0V)
V_80 = ComputeV80(0,V_max);

% Calculate the time to reach 80% SOC
t_80_seconds = Time2Reach80(V_80, V_max, tau);
t_80_minutes = t_80_seconds / 60;

% Calculate the time to reach 99.9% (approx. 100%) SOC
t_max_seconds = Time2ReachMAX(V_max, tau);
t_max_hours = t_max_seconds / 3600;

% Display the results
fprintf('Time to reach 80% SOC: %.2f minutes\n', t_80_minutes);
fprintf('Time to reach 99.9% SOC: %.2f hours\n', t_max_hours);

%% Calculate Voltage over Time
% Voltage is computed using the exponential charging equation
V_t = ComputeVoltage(V_max, tau, t);   

%% Calculate Current over Time
% Current is calculated as an exponential decay function
I_t = ComputeCurrent(V_max, R, tau, t);

%% Calculate Instantaneous Power over Time
% Power is calculated as the pointwise product of voltage and current
P_t = ComputePower(V_t, I_t);

%% Calculate Rate of Voltage Change over Time
% dVdt is calculated as the derivative of the exponential charging equation
dV_dt = ComputeVoltageDerivative(V_max, tau, t);

%% Calculate Total Energy
% Total energy is the integral of power over time (Joules)
total_energy_joules = trapz(t, P_t);

% Convert Joules to Watt-hours for a more common unit
total_energy_Wh = total_energy_joules / 3600;

% Display result
fprintf('Total energy delivered to the battery: %.2f Joules (%.2f Wh)\n',...
    total_energy_joules, total_energy_Wh);

%% Graph Voltage vs. Time
PlotVoltage(t, V_t);
saveas(gcf,'BatteryVoltagePlot.png');

%% Graph Current vs. Time
PlotCurrent(t, I_t); 
saveas(gcf,'BatteryCurrentPlot.png');

%% Graph Power vs. Time
PlotPower(t, P_t); 
saveas(gcf,'BatteryPowerPlot.png');

%% Graph Rate of Voltage Change vs. Time
PlotdV_dt(t, dV_dt);
saveas(gcf,'VoltageDerivativePlot.png');