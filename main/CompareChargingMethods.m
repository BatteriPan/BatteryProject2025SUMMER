%% - Compare Battery Charging Methods -
% This script compares the simple Constant Voltage (CV) model with a
% more advanced Constant Current-Constant Voltage (CC-CV) model.

clear, clc, close all;

%% Define Constants from Spec Sheet
V_start = 3.2;  % Starting coltage for 0% SOC (V)
V_max = 4.2;    % Maximum charging voltage (V) 
R = 0.25;       % Equivalent resistance (Ohms)
C = 11338;      % Equivalent capacitance (Farads)
I_cc = 1.589;   % Standard charge current (1589mA) 
I_cutoff = 0.045; % 45mA cut-off current 

%% Set up Time Vector
t_end = 6 * 3600; % Simulate for 6 hours
t = 0:1:t_end;

%% --- Model 1: Original CV Charging ---
V_cv = ComputeVoltage(V_start, V_max, R*C, t);
I_cv = ComputeCurrent(V_start, V_max, R, R*C, t);

%% --- Model 2: CC-CV Charging ---
[V_cccv, I_cccv] = ComputeCCCV(V_start, V_max, I_cc, R, C, t);

%% --- Analysis: Find True Charge Time for CC-CV ---
% Find the first time index where the current drops below the cut-off
cutoff_idx_vec = find(I_cccv <= I_cutoff & I_cccv > 0);

if ~isempty(cutoff_idx_vec)
    charge_time_seconds = t(cutoff_idx_vec(1));
    charge_time_hours = charge_time_seconds / 3600;
    fprintf('CC-CV charge complete at %.2f hours (current reached %.1fmA).\n', ...
            charge_time_hours, I_cutoff*1000);
else
    fprintf('CC-CV charge did not complete within the simulation time.\n');
end


%% Comparison Plots
% Voltage Comparison
figure;
plot(t/3600, V_cv, 'b--', 'LineWidth', 2);
hold on;
plot(t/3600, V_cccv, 'r-', 'LineWidth', 2);
title('Voltage: CC-CV vs. CV Charging');
xlabel('Time (hours)');
ylabel('Voltage (V)');
legend('CV Model', 'CC-CV Model', 'Location', 'SouthEast');
grid on;
% Add a vertical line for the CC-CV charge time
if ~isempty(cutoff_idx_vec)
    xline(charge_time_hours, 'w--', {'Charge Complete'}, 'Color', 'white', 'LabelColor', 'white');
end
hold off;

saveas(gcf,'VoltageComparison.png');

% Current Comparison
figure;
plot(t/3600, I_cv, 'b--', 'LineWidth', 2);
hold on;
plot(t/3600, I_cccv, 'r-', 'LineWidth', 2);
title('Current: CC-CV vs. CV Charging');
xlabel('Time (hours)');
ylabel('Current (A)');
legend('CV Model', 'CC-CV Model', 'Location', 'NorthEast');
grid on;
% Add a vertical line for the CC-CV charge time
if ~isempty(cutoff_idx_vec)
    xline(charge_time_hours, 'w--', {'Charge Complete'}, 'Color', 'white', 'LabelColor', 'white');
end
hold off;

saveas(gcf,'CurrentComparison.png');