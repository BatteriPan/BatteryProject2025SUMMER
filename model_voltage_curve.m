%%         --- Battery Charging Model Script ---
% This script models the voltage of a lithium-ion battery ...
% over time using parameters from the Panasonic NCA103450 battery

% Clear workspace and command window for a clear run
clear , clc, close all;

%% 1. Define Constants using Panasonic NCA103450
V_max = 4.2;    % Maximum Charging Voltage (V)
R = 0.25;     % Equivalent Resistance (Ohms)
C = 11520;       % Equivalent Capacitance (Farads)
% Note: R and C are estimated based on the specified standard charging time
% of 4.0 hours. All calculations and reasoning are shown in 'Voltage Model
% Calculations' pdf.

%% 2. Set up Time Vector
% Defines the simulation time to be long enough to see a full charge.
% A good rule of thumb is 5*(R*C) reaches ~99.3% charge.
tau = R * C;
t_end = 5 * tau;    % End time for simulation (seconds) (std. 4.0 hours)
t = 0:1:t_end;      % Time vector from 0 to t_end, with 1-second steps

%% 3. Calculate Voltage Over Time
% Implements the charging equation V(t) = V_max * (1-e^(-t/tau))
V_t = V_max * (1 - exp(-t / tau));

%% 4. Graphing Plot (for verification)
% Visualizes result to ensure model works.
figure;                 % Creates a new figure window
plot(t, V_t, 'LineWidth', 2);
title('Battery Voltage vs. Time (RC Model)');
xlabel('Time (seconds)');
ylabel('Voltage (V)');
grid on;                % Creates a grid on the graph
ylim([0 V_max*1.1]);    % Sets y-axis limits for better visualization

% Save the plot as a PNG file for documentation
saveas(gcf, 'BatteryVoltagePlot.png'); 




