%% -Plot Rate of Voltage Change-
% This function plots the rate of change of voltage vs time using
% the equation dVdt = (V_max / tau) * exp(-t / tau)

%% Inputs
% t:        time vector (seconds)
% dV_dt:    voltage derivative (V/s)

%% Outputs
% A figure displaying rate of change of voltage vs. time

function PlotdV_dt(t, dV_dt)
   figure;                                      % Create a new figure
   plot(t, dV_dt, 'LineWidth', 2);              % Plot voltage vs. time
   title('Rate of Voltage Change vs. Time');    % Add title
   xlabel('Time (s)');                          % Label x-axis
   ylabel('Voltage Change (V/s)');              % Label y-axis
   grid on;                                     % Enable grid
end