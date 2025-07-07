function plot_power(t, P_t)
    figure;
    plot(t, P_t, 'LineWidth', 2);
    title('Power vs. Time');
    xlabel('Time (s)');
    ylabel('Power (W)');
    grid on;
end
