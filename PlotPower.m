%[text] ## Plot Power Function 
%[text] This function generates a plot of instantaneous power vs. time during the charging of a battery modeled by an RC circuit. The power curve typically rises to a peak and then falls as the battery approaches full charge.
%[text] ### Inputs
%[text]     t     - Time vector (seconds)
%[text]     P\_t - Power vector over time (Watts)
%[text] ### Output
%[text]     A figure displaying power vs. time
function PlotPower(t, P_t)
    figure;                             % Create a new figure
    plot(t, P_t, 'LineWidth', 2);       % Plot power vs. time
    title('Battery Power vs. Time');    % Add title
    xlabel('Time (s)');                 % Label x-axis
    ylabel('Power (W)');                % Label y-axis
    grid on;                            % Enable grid

%[appendix]{"version":"1.0"}
%---
