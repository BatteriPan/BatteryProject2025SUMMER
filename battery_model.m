clear; clc; close all;

% Define constants
V_max = 4.2;
R = 100e-3;
C = 1000;
tau = R * C;
t_end = 5 * tau;
t = 0:1:t_end;

% Get Voltage, Current, and Power
V_t = compute_voltage(V_max, tau, t);
I_t = compute_current(V_max, R, tau, t);
P_t = V_t .* I_t;

% Plot results
plot_voltage(t, V_t);
plot_current(t, I_t);
plot_power(t, P_t);

% Energy Calculation
E_total = trapz(t, P_t);
fprintf('Total Energy Delivered: %.2f Joules\n', E_total);