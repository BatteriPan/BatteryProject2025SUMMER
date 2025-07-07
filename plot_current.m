function plot_current(t, I_t)
    figure;
    plot(t, I_t, 'LineWidth', 2);
    title('Battery Current vs. Time');
    xlabel('Time (s)');
    ylabel('Current (A)');
    grid on;
end
