%[text] ## Plot Current Function 
%[text] This function generates a plot of current vs. time during the charging of a battery modeled by an RC circuit. The plot provides a visual representation of how current decays exponentially as the battery charges.
%[text] ### Inputs
%[text]     t    - Time vector (seconds)
%[text]     I\_t - Current vector over time (Amps)
%[text] ### Output
%[text]     A figure displaying current vs. time
function PlotCurrent(t, I_t)
    figure;                             % Create a new figure
    plot(t, I_t, 'LineWidth', 2);       % Plot current vs. time
    title('Battery Current vs. Time');  % Add title 
    xlabel('Time (s)');                 % Label x-axis
    ylabel('Current (A)');              % Lable y-axis
    grid on;                            % Enable Grid 
end

%[appendix]{"version":"1.0"}
%---
