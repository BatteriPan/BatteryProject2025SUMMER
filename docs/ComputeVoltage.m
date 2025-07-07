%[text] ## Compute Voltage Function
%[text] This function calculates the voltage across a capacitor (or battery terminal) during charging in an RC circuit. The voltage increases exponentially over time toward a maximum voltage (V\_max) based on the time constant (tau).
%[text] ### Inputs
%[text]     V\_max - Maximum Charging Voltage (Volts)
%[text]     tau       - Time Constant (Seconds)
%[text]     t:          - Time Vector (Seconds)
%[text] ### Outputs
%[text]     V\_t       - Voltage vector over time
%[text] ### Equations 
%[text]  $&dollar&;&dollar&;V(t) = V\_{\\text{max}} (1 - e^{-t/\\tau})&dollar&;&dollar&;$
function V_t = ComputeVoltage(V_max, tau, t)
    V_t = V_max * (1 - exp(-t / tau));
end

%[appendix]{"version":"1.0"}
%---
