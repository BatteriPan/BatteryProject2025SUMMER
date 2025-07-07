%[text] ## Compute Current Function
%[text] This function calculates the current flowing into a capacitor (or battery) during the charging process in an RC circuit. The current decays exponentially over time from its maximum value, based on the time constant (tau)
%[text] ### Inputs
%[text]     V\_max - Maximum charging voltage (Volts)
%[text]     R          - Equivalent resistance in the circuit (Ohms)
%[text]     tau        - Time constant (Seconds)
%[text]     t            - Time vector (Seconds)
%[text] ### Outputs
%[text]     I\_t         - Current vector over time (Amps)
%[text] ### Equation
%[text]  $&dollar&;I(t) = \\frac{V\_{\\text{max}}}{R} \\cdot e^{-t/\\tau}&dollar&;$
function I_t = ComputeCurrent(V_max, R, tau, t)
    I_t = (V_max / R) * exp(-t / tau);
end

%[appendix]{"version":"1.0"}
%---
