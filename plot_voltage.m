function plot_voltage(t, V_t)
    figure;
    plot(t, V_t, 'LineWidth', 2);
    title('Battery Voltage vs. Time');
    xlabel('Time (s)');
    ylabel('Voltage (V)');
    grid on;
    ylim([0 max(V_t)*1.1]);
end
