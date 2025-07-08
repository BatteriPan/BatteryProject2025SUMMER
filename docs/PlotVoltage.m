%% -Plot Voltage Function- 
% This function generates a plot of voltage vs. time during the 
% charging of a battery modeled by an RC circuit. The voltage curve follows
% an exponential rise and approaches the maximum voltage over time.

%% Inputs
% t   - Time vector (Seconds)
% V_t - Voltage vector over time (Volts)

%% Output
% A figure displaying voltage vs. time
function PlotVoltage(t, V_t)
    figure;                             % Create a new figure
    plot(t, V_t, 'LineWidth', 2);       % Plot voltage vs. time
    title('Battery Voltage vs. Time');  % Add title
    xlabel('Time (s)');                 % Label x-axis
    ylabel('Voltage (V)');              % Label y-axis
    grid on;                            % Enable grid
    ylim([0 max(V_t) * 1.1]);           % Sets y-axis limits for better visualization
end
