function I_t = compute_current(V_max, R, tau, t)
    I_t = (V_max / R) * exp(-t / tau);
end
