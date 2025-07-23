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

%% Calculate Voltage over Time
% Voltage is computed using the exponential charging equation
V_t = ComputeVoltage(V_max, tau, t);   

%% Calculate Current over Time
% Current is calculated as an exponential decay function
I_t = ComputeCurrent(V_max, R, tau, t);

%% Calculate Instantaneous Power over Time
% Power is calculated as the pointwise product of voltage and current
P_t = ComputePower(V_t, I_t);

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
