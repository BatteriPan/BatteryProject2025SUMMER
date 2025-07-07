function V_t = compute_voltage(V_max, tau, t)
    V_t = V_max * (1 - exp(-t / tau));
end
